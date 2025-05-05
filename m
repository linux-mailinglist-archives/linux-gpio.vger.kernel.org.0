Return-Path: <linux-gpio+bounces-19610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5EAA9B31
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 20:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C7D188D0DF
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 18:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE24F26E15F;
	Mon,  5 May 2025 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="RVxTvOQi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166134CF5
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746468457; cv=none; b=nGv8h9C5kvzohZUtW7tdR0wzu+c1jOaiDW1iGrR6TgPEJH6BQ07QPgcIxSlqr8mPS+fnkyCM/mdLiPpZip8mnYVG47HLxIMjXOhzk/ZUJNXMHxzMWBCwsWt/HCI4UFBZcHzuLMFQu6PCQ+KOLAedBVPVYEH9nlaOYMBJA6spbrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746468457; c=relaxed/simple;
	bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IIgS3nPAda2yIbGPSSNde+2gBgOJBto+oXIma2sT+UTROX2htV4Bg7dVlmIjnkLkc9W5HIaDPnhgGoTkBSJRLsbF06F1877UkxFMJ2i2s5wFakEdnVv3x0aO7CyosHxOxCMdWjuFmru0Cvc5sJ4j0tbN5INTUSRQlySMX8ZJiEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=RVxTvOQi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso820212366b.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1746468454; x=1747073254; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
        b=RVxTvOQiNaqvm/MeAdkgdummGg00RYUKlJp6/NKNiP/JGkqshR5J3lRD4V/xmCCqQj
         uYGYasSBOVPT8jHUOduIdNe/He50zoL8b1eJHqvvc4nPh0IcC+/8qWQi3TmKGhB2/wt4
         azIhpXaHQTIdxm1cCUrqtdp3uzgTf7jjYYwMRi4xvbqAz4UxgBo9HbM/kNPMhOKykA/F
         srpBW59JBmLJmyHUyyK+J3t/yOFjDzj5Z46vYwox60C2BMJzPfjM6eOiyNtJ9oXZz2tX
         CyvUUM9rrq40180bMPVfOuszGi/aSOz880TE7bOEMeM3hKtclQwwZfrFu3np1vpzNqj9
         wH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468454; x=1747073254;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YflIqSONWzWvnPgcJpFDDON/LOz0XMIPgbeLEZ/KtmU=;
        b=uQdsyZJLaWkZwk/+cxpYuJ//HvHDv2o3t1/RR3rhEyXEPmj/qD92yOxZAiHOKNSimA
         dyhpiR/NhRnBY+X+JcAweaiFeNm064VcG139VH9MK9pTP12U2tv5ubuf++wCfGLoP1Gp
         N8OWAjpbV88wv0284nNmyTjpEAA9u0BqpAJ19MbBKl4zaIK6P+AOFcT/402i2fBpJl8i
         ZaddffVrTjaoSf4kFK2OvMz/wEhmNxfOCttEJb+l7DYtNMAcgl+HeXEBw9f7SClr7OSz
         FI9TBsmC4z1Zw2JGgx5aPUl7shUGa9NGtPiY77F7Fb7M2J5pu4sPF9S97Z5LMsL2sgxx
         MbTA==
X-Forwarded-Encrypted: i=1; AJvYcCVk+C9ImEF/7yNnudrGkzLPMqPakHKp75whcUcoEc/7SMvTbnox5ciefjjYIioXNWka+OISics4B4jg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtdv97Zp9FBMXSKX6QZ0dQUz4beSMsBWCk21js7OtYw5m8FVDx
	cL/7fobPdjrt9kzdFrgSSt4nAWCfBJCXkIISrbHoee5O+Q6m/b3Da1BF0+C6WNUz7P+k8gXT9Sv
	q0ffNrzsSW9OeXzFbcgm2GsHKD9/0Io+Fcfq80A7Ir2Ab5C9bG2P/eA==
X-Gm-Gg: ASbGncsinMdAsVY/k8gLFwdR1yR9HZgWFgKPACVSUfeo8JOkjMaAUokd0fkljWa1utN
	oHGJQQJwsNWgzb5w17legkws3I+Wz0QEey6HiFMzDp4euQGKl13QcSFbmXNHBxvtj8B4BFyyBMn
	nl3Odc5sJ4b+9X/16Ao/NawjRBTCENF6GXHH86I4D4OSnlBnmdRwZjP3SzDhIPBboa
X-Google-Smtp-Source: AGHT+IHSRPzRWtPKUw1zCPRlWBydXasAt8fgBM0eH5lSar+hmCu4lARhqrRTbC9gibONmU1LyRBAbBqu1K3t2r0V8W8=
X-Received: by 2002:a17:907:c706:b0:ac7:3911:35e6 with SMTP id
 a640c23a62f3a-ad17b868b5bmr1229064766b.58.1746468453986; Mon, 05 May 2025
 11:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ariel Simulevski <ariel@simulevski.at>
Date: Mon, 5 May 2025 20:07:23 +0200
X-Gm-Features: ATxdqUF60hWtQUn2gXgmf4MObMdDa_KyrdeNqYiO9XFngXF8KF3NozcuiLquYcM
Message-ID: <CAMz-Jg-Vz9npxtVqjPXnK_WSDm2zc9_MBsQKTJKVghaSU7fyxg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Document supported platforms in
 Kconfig help
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, Ariel Simulevski <ariel@simulevski.at>, 
	Guido Trentalancia <guido2022@trentalancia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the feedback.

Just to confirm: for the Kconfig help text, would you prefer keeping
it strictly to a plain list of supported platforms (e.g. "Supported
platforms: Tiger Lake, Alder Lake-N, Alder Lake-S") with no additional
explanation or context? And only PINCTRL_TIGERLAKE because I think
that the note on PINCTRL_ALDERLAKE is actually quite helpful.

I want to make sure the v2 follows your expectations exactly.

Best,
Ariel

