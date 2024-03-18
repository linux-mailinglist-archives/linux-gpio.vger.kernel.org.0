Return-Path: <linux-gpio+bounces-4435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A383C87EE8A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 18:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D45B21C20EE0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Mar 2024 17:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E58E54FA4;
	Mon, 18 Mar 2024 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaCt66pf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68855E41
	for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710781988; cv=none; b=EMpAeSJBC1kA+OIayj5VKNIrbOasBlsEeZwZSbkgCDDNlwGWNTwpwluyT//YhcY8cWDYovg500lzerehZtIEMBqY+W+JiQkYX7aMfn6Lr62nJjAOGVi3cpHqmjALjCX26n8HZR5/qdmDJ9FzxUEWIBJ2S3soQpndSuTcFwE7ZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710781988; c=relaxed/simple;
	bh=Uu/19bRxII1WrcPVCrEsE4ocOlJgmTSauhOE4pP7QB4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RuIVPu/AzxqwW/Qn8gJiOJoOz43hZTCk6KokjpEFCX9bV7H/30AZfysRKiX+wuHVUg7HxE3M/ZG3fh63/NjCocrJj9grRCH59GPkigK4yYk6AXFnABFYkn8B4qofwgk5amS7Bbyk5V2Ma4CMNQdPmm9/UC09bXzBsCF+bGE1EoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaCt66pf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d52e65d4a8so11540811fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Mar 2024 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710781984; x=1711386784; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uu/19bRxII1WrcPVCrEsE4ocOlJgmTSauhOE4pP7QB4=;
        b=IaCt66pfqHMbniz2ybo1xVGNqEivLhodvsK4rR+tH4mIV7jfAQlDdqwao3jrkrOyyW
         2i6w6lEiwA9lYtE3MpJsDnzkqA129WZBN7RGiQr0d67znr3+LasIZuhOvjDm3+l0wQoR
         NH/B10PAhrr87mnpy0ixdgOMdyG7CkOhRrPCzM5204g2p97A3X+2K92xOY5OPVnaoNXe
         XN0a2G942cPZHIhjOsx1Z8Xn8iSGlOaxNaX1C3fn1vtdrrTJAhCeA972cAa6b20Fco98
         GjKQ4zDm/7OB6wtoHRUq+8VK2tyHmxndJ/JgMkQ1vtpVHwYkI+/UPIfulSL2M63aDylu
         o6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710781984; x=1711386784;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uu/19bRxII1WrcPVCrEsE4ocOlJgmTSauhOE4pP7QB4=;
        b=QBpJPFnx1bg3MtkAUqf0aXA4TCgQQZZLLPEpQVWAzkhELUzTRnqiGFxmdhXYxalnMo
         DKCSJY1+NI+JVb7RcJP/VyUzhZEDFYAWLLGE5F4mSvTXjYg4P3wxlzdZHn+DJBNhE72/
         3Pckd+B7lMZxFLFAaOuloEukIU89l2ANukFkI2q1O5nC5B0gIfUQtnWGIDFl7+1L7guP
         27+A5FoT8C1TifJ2FJWPSfgvEFriEmXOt6bF1rJOdz9KQMv21T4Khc8+PAaO6au3LKjE
         XNJzBUmJLnk7pyYSWkxKin4o42wog5TnWZvuH399qbDDtDwlO3SsFeBhk1XWR/44HpWI
         jrCA==
X-Gm-Message-State: AOJu0YyiHTheHzFFeeXmr85jQuEuHYbmujoo+/0HM5uihSFE3X6QVwHB
	iyvcOgMBA24ilUa7CK1gyeL3gt3zsDzebH6rzS4yQQTW18obtpeoYgG/LFbyv5GoXFFLfPqo1J7
	p583U2coxPRzVi8MAwZZwkVetbQFkUYVvLFM=
X-Google-Smtp-Source: AGHT+IFjMGvxCBRFD39ZR0Wh6jx6E1JBPmdUBES7Lwusrjnvp4A9FBUWZyOa6k2gzmG/AF+ex5R4ginyacp2fP5V9os=
X-Received: by 2002:a05:651c:23c:b0:2d4:7717:8865 with SMTP id
 z28-20020a05651c023c00b002d477178865mr93006ljn.38.1710781984271; Mon, 18 Mar
 2024 10:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vincent Fazio <vfazio@gmail.com>
Date: Mon, 18 Mar 2024 12:12:53 -0500
Message-ID: <CAOrEah4J2U6eoyJrUar62y48GsiR8NahJpodkv-V80RRQxQJrQ@mail.gmail.com>
Subject: [question] Does gpiod_set_value have a "guarantee"?
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Is there any implicit or expected guarantee that after having returned from
gpiod_set_value that the GPIO will reflect the new value externally?

Some drivers that leverage GPIO to emulate buses, like i2c-gpio, may be relying
on this to be true in order to make a "stable" clock.

I was glancing at https://github.com/raspberrypi/linux/issues/5554 where
someone ran into an issue and it looks like, at least on the RPi 4 platform,
that there may need to be some "flush" mechanism to guarantee that a GPIO has
been written out.

If it's the responsibility of gpio_chip->set to do this, then I'm guessing the
pinctrl driver may need to be updated, but that does incur a performance hit
for every GPIO write.

If it's up to the bus emulator to do this, short of sampling the pin, should
there be some API or mechanism to assist with flushing writes out? Is there
already a mechanism to do this?

Thanks,
-Vincent

