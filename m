Return-Path: <linux-gpio+bounces-8656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C497794A9A4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 16:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C191F29CF8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 14:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51586F30E;
	Wed,  7 Aug 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OwD2h9d8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A124A9B0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 14:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040048; cv=none; b=T/JvjWQ59v9tP7toNZ2+hcR2NwMbDFDTB5MdpiHgQ8ggWf9ZUXLc+//gzUyu+I1in15GdtlB826ET3trz6GoRM8gNNqNbFijgLkM8V+tsb8qkMDsLIeOl8/JDb5rAqqFyR0q1FSw8snFbuAhqljSAa5nLvHrxe5P4HafL9hSGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040048; c=relaxed/simple;
	bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SRVrOm8gjEpFWlfXNcrjOlielzirUNQ9ZNjZHJaAd+MdIoC2Sb6lNuqGN8/x5pRhnv1pSOp9pHEx+t58sJE0T5migohwCFcJ4tdbm8Ep5/WWSx2FtqMrBFsHSG5+EakAL/JnBt/nBnw1hXqaLURDK/9a0GDo0+SunKle8nL76Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OwD2h9d8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428243f928fso17838935e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723040045; x=1723644845; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=OwD2h9d8Fq+AxxtD6Eqc/1OmqeQCR2VFt/qMzg2llFEecWOqAuZEat40KAIubrtN43
         fTjPpCxt6g4SIf1ENA+Yp3152uMi7wSp6cdL5sfWb5dTfEzZIy3JdNeE7/qYX9/YiMZf
         GFfvIEjyqygrX5TpFSbIKaqXqkr/5WFoZH+OmgViQNpV24Q0c4guDT3jFUNqVhjeDAsQ
         ASpgvrxr3wpjfs6AsVB4V220UiOfslfrjCT4zSHQJDCSgH+mkKuj0l3/9llIeO8S4jyg
         zWW79zCnWONI1eV2ymqvLhFVwnxS8LjWGvU0DJ+NcdEu6wu35c++N2FmgeEsC5nQrpUq
         EwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723040045; x=1723644845;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8U6pF6oteZB3sbXc3seOXknJplxg/i1fuxIfbblSw1M=;
        b=cYYUjjbNHH9NPmFQVm9qyDP2alt7eeR3LXvQ2PYeDZmcAEFD26YxUEjbPyk/XJkkyX
         tKtUrmELTi30NWBeY0jI8OLioXLe31xjDqLdQ4LUsJ+1wrps191aXfh3C6WPB8/sUDZ8
         JNORe06rJB1+xZ3HFxmw6We8YXO9GT0vuxQTQ+Dp3f+Sh56uTJuEFIBCrEb40Jp/6GW+
         nvpthVrYE0JNpNn92jCCpuUnLnZYzu+gdGCPXlCtC360aftA++sjqWNnwKwvEUidg2Kt
         wjn21wiInbkfZovAlHx6yldOM5RRT2VU+Higs6gcjcD68f5VGdJ9ir2jNkBB2fGbvlvH
         DZOA==
X-Forwarded-Encrypted: i=1; AJvYcCWdG/jjjFPEvBtwI6g9eJMx2YPyWITuxGZvutGbple5AncshwNF7sKc3uOuc1lthbuPhYt6MgLe+JaLzuYjMtsJUkXRxZL7eHuS6A==
X-Gm-Message-State: AOJu0Yybbn4nnaaaNS7SHzSwHFFQ945vij0v1em3D8/MMkUPmEi+zPJY
	Z0XF8Vzg1srB35O8D+9925UjiRKpNKFlXynfuSAhTU4ROfYKVH/o5yrIToY+StU=
X-Google-Smtp-Source: AGHT+IHFS+8FxIsgPDMxXI2119/zXQ32Pp05XpEgQOQyCV3S6/MHUfyYDHMpWs/M91Kr6YsvZoGl1g==
X-Received: by 2002:a05:600c:4853:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-428f06c44cemr111691625e9.36.1723040045344;
        Wed, 07 Aug 2024 07:14:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fb34sm32100245e9.14.2024.08.07.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:14:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org,  neil.armstrong@linaro.org,
  khilman@baylibre.com,  martin.blumenstingl@googlemail.com,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
In-Reply-To: <cover.1723022467.git.christophe.jaillet@wanadoo.fr> (Christophe
	JAILLET's message of "Wed, 7 Aug 2024 11:30:54 +0200")
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
Date: Wed, 07 Aug 2024 16:14:04 +0200
Message-ID: <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 07 Aug 2024 at 11:30, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> These 3 patches constify some structures in order to move some data to a
> read-only section, so increase overall security.
>
> It is splitted in 3 to ease review.

I'm not entirely sure it eases review in this case.
If a v2 is necessary, I think a single patch would be better.

> Patch 1: struct meson_pmx_group and meson_pmx_func
> patch 2: struct meson_bank
> patch 3: struct meson_pmx_bank

Is there any reason for leaving out 'struct meson_pinctrl_data' and
'struct meson_axg_pmx_data' ? I don't think they get modified but maybe
I missed it.

>
> All patches are only compile tested.

Looks good anyway
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

On the vim3l:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

