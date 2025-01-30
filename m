Return-Path: <linux-gpio+bounces-15108-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D914A2355A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 21:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C123A5DA9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 20:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F3A1AF0C3;
	Thu, 30 Jan 2025 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ycj2yF98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2471547C9
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738270082; cv=none; b=ehYhVVutDCLjETGdFJQYXEPRgtZRPsXP8id+ts2FqRaUkQ0nPauL9dDMLg+E6YfK5O/b6wetZaRnWjKR5RkC2bUqzJ4c/vI+vBTMHRYtN7yqyeSbqZS5clcnfzkaE7qKTv5KgrvHEbXcWY0UnF1+LmruwwJQe1lec1Y2bspY6ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738270082; c=relaxed/simple;
	bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l64kZoBNpvSym0hnb7288pIBoPNLqK2FSwOtkOKY156ePaWsuz3zUqhN+UeU1a6cgUG/XeVx9BowUeO/VF31JTRBqMoTGovmVm18WsxQcXD0Qbidy/JevroDK7QPXo/gyc6H4VUFySIqmS+40YvXD9k87+jSlc46X5B0MuTV2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ycj2yF98; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e47e93a3so1373370e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jan 2025 12:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738270078; x=1738874878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
        b=Ycj2yF98Et9fWw5KJTq8yszo1781Q6dVS17f9nmWjVroDCHs6RC6SU3XxXPxhiKSfW
         Mqe1VEp1G6FewHcwT3vW51DUFjCwcIf/xtOX0kFbf5C2PEUhpyC2offhPIZZhftX5UDB
         GLRjK1kblePbIUFfuKWn2kXVmIEn5l95+t7RSi4PYXwB/bM9CgFzEtxwM7XrAkey5cu/
         ILP0DpNk4mipvncbqMtnSAujB1mbI+uNRSoGrHUva6pvuZ+q0F2CmYSYydjwYK4a375w
         OO8oFESvW9jnY2SAdPRCxniI2CkPh1rItRcQr5Z79qQnrMUDUc1wb3JEFcclRZxox5EZ
         YvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738270078; x=1738874878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
        b=Yob5pqX/jzrZkf83AbPVedV6zm7bWxWBStga0r7jOZ8kAUj10P3RQzcWLUVzICsUJ+
         EV6bPAshtjwdgDR6nFduGnqSF/jXr8tXyn46P4CeYMC005kETeLGECcO7Zlkfe8TjXrR
         nKAl1XEFHyPSzfu8zkOYk/rDf1EmI9N89z45H25zvo4WvAgrAgwKZhutBbIDYED4vHKP
         a/ad9oFpZ3GZoZpPyTXXGDU0gaSbVNwgZK6fwPmGf4e+6PgC5tzNPCJOwDs259xRz7ly
         XCUb4rHnYA4dAHVeS7/z85nOEdIVx4I8Qg8EcmfKNZJF0QmpOqR88cchLTy4/LzN3obR
         NCfA==
X-Gm-Message-State: AOJu0YzGAzi11Lgb9BcWV2h3tP2LFRHwcX+YfbtPnJYyONO5l90bjxvH
	C1CL7Zhqj1xSxUlGMwUcyd0r/GBZj9vD7xuckQ0f2coXHHLi5a6Xf59icTiSZg2mKVxPVDK39U8
	PoiHSMdud6xPHQHZkHm2qowzglbxrIK8Sh5gJ/g==
X-Gm-Gg: ASbGncu1wqMfniqw9yx3ioSXHO6O85OD6qrDBagrILXK281Ls+86wgYrO8/ka9YVF6C
	GDWkPKAQ7QFy2NbLNRZaLEK0xsyI4vCszW5kOzKE9dHeF7HODq8JN7xijs3Z+78oOaYjI5qVytD
	SHGKrwmZ1cjJa9JcbxqqamxGYcOLTu
X-Google-Smtp-Source: AGHT+IHQiBZi+5WIgFL61G3A9QcuOL44bcnpT6mV6FVgYrunkad6n814hnmY4EO3AWPbGhCOdR95URu2UlrlmW3JN+A=
X-Received: by 2002:a05:6512:3f15:b0:542:9883:266 with SMTP id
 2adb3069b0e04-543e4c32bfamr2847359e87.37.1738270078206; Thu, 30 Jan 2025
 12:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv> <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 21:47:47 +0100
X-Gm-Features: AWEUYZn_uMJ9GcuvHmfmQkNcxj95bMksipW2335c1zfAK6UFKZVo0Ffn_oFKBbg
Message-ID: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> While at it: there's no reason to impose a
> naming convention of lineX, lineY etc., the names don't matter for the
> aggregator setup (unlike gpio-sim where they indicate the offset of
> the line they concern).
>

Scratch that part. There's a good reason for that - the ordering of
lines within the aggregator. I'm just not sure whether we should
impose a strict naming where - for an aggregator of 3 lines total - we
expect there to exist groups named line0, line1 and line2 or if we
should be more lenient and possibly sort whatever names the user
provides alphabetically?

Bart

