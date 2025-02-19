Return-Path: <linux-gpio+bounces-16212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89EA3B2D5
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 08:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7A3169882
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 07:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AEA1C1AB4;
	Wed, 19 Feb 2025 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="frd3p2yW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4131805A
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739951606; cv=none; b=ENQV+iTY2Wl3hOUgy2VLc6hgLesjmb+FzumUgBBXX1NZFH1GKifWJoSRMvWbCo8FDPl8396AwiwTe4Jmyc4/Wtt468JN0GLW5UA82JjUn7j7aRfZF/vbUMoeOz4DYBl2wNdJKjfsBtgfN19in9AzIUMeE+gzI4vDlbjn6aI9Eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739951606; c=relaxed/simple;
	bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk5pD/nGsQrBbIvePfq3k07Mo3BUvw7NkqqhslZykthguKR23jsM7w3wExxXaib2voom6h86UPuEIPiKieXkrJZqXjJvaSda5gfkJB0oI1dKGV5zxmWraR+5mIMZTYYjbe0jsCEBuw9bC3wzfZNA8dilMK2bWTGL4tyNqxLo9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=frd3p2yW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so4576727e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739951602; x=1740556402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=frd3p2yWth5IRMRSr1E+vnZgsYNrbpv4JzvJSSFK/Xl/hYGeR8bxJpuZAqRhaN9LMO
         DS6No6srf9/oJVtpA4S0lkDstijL+YjRDJPCjTpUxS9jaeHQp+45/TcMoBkgFLMafvhs
         MjRSvA8IiS48bH9DtWFAOl1VPNAwCfXbq2a/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951602; x=1740556402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=j5aaBLwj0hqOQKapPaN2iJmL8/Pe3g86Fsqx2pgKbzHbNEoIYlLmTMkGT0VBvBbi7q
         alhVps6moslCwDc2hpP2rGBlqgv1hFsOMZqneJvgM4RC3P7a/X1siSSGRRIZNJP3zoJf
         CQS3ERo7phN0vLpuC1KF+33S/z/7u6UNOPFl/KWpCoxA7DSM7lxydIeWus4Nh3kswOuI
         DVIh/OaJnADPysPdmFZciWjQ90ZvtQkOfoXz8PSqt0aT61V5rQjdDRzWkIslZDsB0DsB
         D+XDgn0S/hhm0rv/pENrf6p9Z3jheFETtaFoKn7CQc5Yj1dPgreurJyvZxAzfapVd8x2
         m9OA==
X-Forwarded-Encrypted: i=1; AJvYcCUXckXDrqWOK5rXwoD3p0U7Y4JOkyhD6muEZ1lt7fDhRNBj0UMzwvnhDAwN1vc4Q8+onNSLrS5OsBg4@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7o7J9SxzTZiYoeR5eiJw/SNnZ4LDhCHtQwjwRTOJ0kWzGOYu
	RMZEZWqpLDM2r7qiAQuQBfcu34S/cAPFkZ17zix/zzT/11zoa4IugGdcPGI1J8I274SpyhuNHnl
	rVfeJnxJz5TYxXQJ3nl6AYb05DdKAyujSiBsS
X-Gm-Gg: ASbGncs2t9YKJ9U1iHsZJyIv0fv8U+4qALM47qCWHtB/AhsvTqt6A/oGcJ0d2oLhzls
	8sNh+g63bYcqVI8uJvQ7+d7CNPhczJfniFNkHsxmRnzVvpSL02negqW/f/lNwxn0Hbwz5VF362S
	tQy1hOe1RHqHpWvHJacoUZ7zhF
X-Google-Smtp-Source: AGHT+IGy4VRhutR0vRN13zFXFDojHsEJuy46LrrJBV/lkfpvoUaq2PR47QMvQ2pB0zIzS5cf5qZ8oAPqBxANqsj6Ktk=
X-Received: by 2002:a05:6512:ba6:b0:545:22fe:616f with SMTP id
 2adb3069b0e04-5452fe45d87mr6468841e87.24.1739951602616; Tue, 18 Feb 2025
 23:53:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com> <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 15:53:11 +0800
X-Gm-Features: AWEUYZlvGLuYzddD01vTxGm9KhUE8PoFe7dSks8I_T3Q6YOVZu9GJJUxvzhxQB4
Message-ID: <CAGXv+5HLmmNV9WZFjOoJdLQNvEW6-FVdgCDrgv2LCoYUrd2Bsw@mail.gmail.com>
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <seann.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2025 at 10:55=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:
>
> The eint num will obtain the operation address through pins.
> Change the traversal method of irq handle from traversing a set of
> registers to traversing one by one.

The change only covers "eint", so please adjust the patch subject prefix
to "pinctrl: mediatek: eint: ...".

> Change-Id: I3962b78042d32501a73153201cddf52c6b62a695

Please remove the Change-Id when posting the patch.

ChenYu

