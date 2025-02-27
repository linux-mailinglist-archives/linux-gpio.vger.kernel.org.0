Return-Path: <linux-gpio+bounces-16735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51659A48C81
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AEBF1890A40
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E472309A3;
	Thu, 27 Feb 2025 23:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHPArRCv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E341272903
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 23:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740698088; cv=none; b=g+ZhE6c+J+GeACit9KorT8A0u73qPtUVj2jcVVNkXaH16Vl/HIBY5Mj9qlS6Jg6o/5X2W7CFV1VWChHjv9F6VC2aCyPERaOhQchj/XsJiFBjxEMfUe4xPmqsgAlMmmKMLmGxAcZxWz0l4ft7g5Yuag7AoFMzitRL8RVLfytoEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740698088; c=relaxed/simple;
	bh=AnuRApjr8EMi+iloki6ORcjaT87Gp2iSLXaCOHdnddU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXeILkxV4fYlNNt44KhDlbqFH5MilEtkj92udT5NVcNhD5MYZQRsmSZsfcNpqtLz3JJkkIyzZEVfDxYQFXa2yvslN+2UjpZuj2p8RRSmy3E1EcJN7ECTdoZRmMnFTpmXmX3jLyy8vY+gwsOtfv3LoIApTJCUyqF1k7lVwslQ878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHPArRCv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54524740032so1481011e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 15:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698085; x=1741302885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkUpLsB+tWxeVtC8e1hLrjEnl5f+xvYNaekBrtnharA=;
        b=vHPArRCvoWnCjZC7BJoinlnnqZlv8mjwP+Z8qkW/Ti6O+ElXLL8MQjaW5v5Lpo50WO
         8jxqLHUklmXYVyvTSryVg8IaxNd1stv+m5PLYu+kL4aKyaOuUgIvFPdYmpAL+QmzKAgS
         ZkohwPFQF310bYKY6QTkW3gH/G/lmtHbLYQp1lBWAsL64DJv5VbCwWt445x8bCAOQJOo
         KyCaCdCZhcejFUmAoVKoLUFzvtw1tCpCVT/E5LaWxaUZuEKGe3OwP/j5MgY4z2EQNaQt
         /0KKGqiEQYS9Grj9yJnNXlVEO5IsRXVrVjfA3+d7OJjYkKKKVdVHDFgE01sev4By92q4
         1PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698085; x=1741302885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkUpLsB+tWxeVtC8e1hLrjEnl5f+xvYNaekBrtnharA=;
        b=KWMXuTEuMKjBCdxb0ewykhchkcIoQBeFsn0QlbMjn4fsl3rAW9moK3e9KsC9HiPKHG
         6odJ/3xg6KIBcpXO7J8vk44ODz1VMTT4JbgUia7IdPAhP/WmCmAZ/SpaOuNQWeZwl2Nm
         LOShsRsC1bWEZY2cCBDJsiRzR9yy1poaW93lELErk8EbHZrd08VZuzIyYb2TMaqqYpK5
         KVNU2avzn9T9Vw4lpUlH3kK5lEJTrwyllmWYVCys1Gbg30672+wZi45JFukLHN+TX5Rl
         gDhEvKXUuI8OA/g8a47JB3Qs4JxwvOdNemUd+NgRuWi6samC2RRPqlav0A1xa9rrv3iX
         olnA==
X-Gm-Message-State: AOJu0Yx1LszEXI5OCfSyg+KBXCW5GK4Tf8hgSUrJkjQJVeihU+V45rUB
	+YOBpQy6uMAZs5GktOPj21lizs4lN4GBLnPXWfn7WQRP07BNjj4EdWQ1Ddwju2qjxwAoVVA1l2w
	penaguPgZvPBmb9lH9Wx+ldspODMu4+IkbVhfTA==
X-Gm-Gg: ASbGncsoo/BXMXhTq2X5/oSKKlaViObJMuvvwYnohUwSUU6Tet2H7QK6T/tkVD/NLTA
	PqY1+YOKGyWHJbNABCR+PxRKS5Iz64jScOmzSvV8iyOgpRMDo8rhVoffavqumrWtc5K/2nk1qGQ
	Hqab5CXRA=
X-Google-Smtp-Source: AGHT+IHZluLxn/bf6cpXOKGWEyqUac+5KCT4ifo6lWibr2coM7mUN1dentZWywii8b7k2GRtSbindSr/ckho352WQ5E=
X-Received: by 2002:a05:6512:281d:b0:545:56c:36c7 with SMTP id
 2adb3069b0e04-5494c3521famr548226e87.41.1740698084625; Thu, 27 Feb 2025
 15:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740157176.git.geert+renesas@glider.be>
In-Reply-To: <cover.1740157176.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:14:33 +0100
X-Gm-Features: AQ5f1Jp9E0NSS-IJffWh9Wl4UjBU0iqQJd0gDAq8jLGonF3nfq7IUtVCYMpAPkI
Message-ID: <CACRpkdaBuFm=xEs=39n9pboV1J-SjRKUyKo8GPY_EjRKuUvAsQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.15
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 6:02=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.15-tag1
>
> for you to fetch changes up to ea4065345643f3163e812e58ed8add2c75c3ee46:
>
>   pinctrl: renesas: rzg2l: Suppress binding attributes (2025-02-20 17:33:=
08 +0100)

Pulled in for v6.15, thanks Geert!

Yours,
Linus Walleij

