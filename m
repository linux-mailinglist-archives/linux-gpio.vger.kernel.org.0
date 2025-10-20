Return-Path: <linux-gpio+bounces-27320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B9BF39E2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4ACE14FDDC4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FFB334C24;
	Mon, 20 Oct 2025 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRHOXQiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49F2E1EE1
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993925; cv=none; b=oM92RSEFUzBPWFtECk3VjXXzK1DCzCC/inNuK2mglJlEJdEwfVeHo395RRfYkslWhibhXN5RvXv30zpzGg6NF4cwhsFeycCbJAN9kTG4hhXcdPICRWAnOwppJ9pDLzsRbqa320yl13btGoTpiD5UAaThPvG2v55Q4sTyVEprZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993925; c=relaxed/simple;
	bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9Bbl3vV2UvRHGfII2fzwptDlI+5UWoE9WhkRcOFgxdoPd03+1t6LBw0MT0wK2DYYFtZ9TPchhMlcVYg3EIvbzOYBM4AOn/jye7BBwLW97PBn6KOlM76wBctfJYrptG4r34eesoY4OeRHwMi/lB8D/5FcpsfhTf/Huamxf9x7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRHOXQiz; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37612b15a53so53260581fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993921; x=1761598721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=;
        b=qRHOXQiz/dgOBV+n/rotG0kapKJfJH8faNvql73M51+mB15OOIgiWa2VjTq9PjuXGf
         ClAcn6bvkEchpBAO5o7yT23QfyvaSkCQ9nodm8sWChS/nsTFsN6Yyg2hFhU6PuozOUPz
         ptD2ybjuZS7jz8+x2e7K35c4cNPHC1Ij/Nptjhvo1vtquOHFwHr9bdYtkcAkcd8DBo3/
         R4QKT84VwLiZiZOChBkcg8uBb3qYZr56eSadbFPm+kgfegTqHo9CJos7oX/zFdt95cS1
         b2K4HIggWP3eFnYogZNRtqt94uXDtSAKeP6eHoYLskl3kWHL08j0gz+qLwAFUOwp5k3Y
         R+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993921; x=1761598721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3lZxJ8LZRt7zokp4kQuaYa7ZIlO7H8mMjodLLMpmAE=;
        b=RqKsk7aw51Z/88hDPhK5fYtBv636VskZzCo9Cx3rg9MLRxc99jF1jyNfFUhK/cBAtv
         3eMowu2t8WHxkdmd0u85EoYhcObUXqzthMj6m0oErD1k80bJarPB/1Ei5pvYX9forBzp
         pRXQz93HkbuX6lM5DE8nDxXtjKIpdF3UHjsSLH5Qk9BpTqxMI/uNtdsdM9crnwiwR0WH
         N/uBX5o58Dhw7mlbxFqe3A+XIhdTQrJwDZyZOx8oFXpN1/NVMM3pQjrzFxH87q9+1Ehk
         AdixQRWl+LVX/8x9l+Op4KYBxibFEkvBkY40upNnXxz+DsAhALkiCSbGkdffUayR7j5e
         p9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtnyzNHPxzVkTWCfRbr0q5rxvBMLbzp6PV3ccasTHSwf57DG16G8r8pPgbRFiEBeG/X/LCOLIK7BD7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Fc+K6nQ30RakdjnExJP2sV4OHliN0YDFBz2hZUMUmyV8HEG6
	otjA5utBSYr8BwkOvEt+jo1NHpjjJi73TQMgTxCj0hsK85hRHf4cDNtwCca/Rnm9xyrgFvzIxuj
	4meBlKlUVxPd4X/V/iRrmnub2//PoKbjLlc9Ob2CysNqVL/zEQZdgyzzK0g==
X-Gm-Gg: ASbGncttB5AjqCzxTKfO1qt12+Bht4ROu9nOP6z8zbdl0gA6dY0x5K3ycjToCjSH/WR
	Eickx66MPdWX1dasq83vxVIpDkPxOL42b8re+cKYTTm+RUTRxpEPPYTSDYsO+DgBNlJxU3gfDlN
	s8CdEKE8xnawloWg+3IMikofPB/hBAa2bU3onl8oD98kLxgIxuEPAsDSqcFOU2G+duKm8WcgBD2
	YzZ/0JxuTqXJm8zfc/JIerCMVypj2LY3tBzvVSTdLM1oFl85lwYxgZJLxM8
X-Google-Smtp-Source: AGHT+IESlrrK+D5XHA5lrAtuF3QlfvYzPMpNJcOzLYtG5TeUOwa/oJlyZIePwgIJZ8sArPfbw2eN7GwsiOCsU5SJLuQ=
X-Received: by 2002:a2e:bccd:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-37797a3b30amr47334921fa.29.1760993921578; Mon, 20 Oct 2025
 13:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013191235.4139259-1-robh@kernel.org>
In-Reply-To: <20251013191235.4139259-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:58:30 +0200
X-Gm-Features: AS18NWCPfd1MN2_FI_xXjIXan8SG6Tbr5kEprX67_1-EY5u7nUJdishDZNpf4qI
Message-ID: <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the bitmain,bm1880-pinctrl binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

