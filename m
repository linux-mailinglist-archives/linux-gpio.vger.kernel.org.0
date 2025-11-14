Return-Path: <linux-gpio+bounces-28525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8DC5EB94
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 19:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19EE94E5819
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 17:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3293451A9;
	Fri, 14 Nov 2025 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mT5DPYXc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B062E32936B
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142709; cv=none; b=dFsVS15VSY1Y+AFDZkztnDtMk5ShkkF90nLXWh8kTUchefpLoBwEAxALqaYPe8ZLWt3MYx1DX6n9ApG5M7QVq/y3al+7ryoMBWbsCmB55FpJ2sfFR0GwE1RJwL/7lT9Aja3JaZTNhh7P9UPTys2n3zyDMHUVu+KtA1EMDohfPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142709; c=relaxed/simple;
	bh=kbANdFo2wCpgk8SkAnrbtCfbLoz41BopBsENTnROV1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMRFRaEXSVOXMdlqFEQhf9Mzvmu/m/6sd1Kf08Hk0fluRivtbH/kaJOp5X26tfA3ORIHdz+Ns+HD+SnZg6djjkAwVVF3deaYx/Ba0cLUE9PegEXe/Hf4hvtdoepoSdfsFeSlfPh7YrhWT69DSG4okU6hjUYdWdhznFs8pmX9rGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mT5DPYXc; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b935df7bfso18810721fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763142706; x=1763747506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbANdFo2wCpgk8SkAnrbtCfbLoz41BopBsENTnROV1U=;
        b=mT5DPYXcn6BHMgH1w8cqdUI/qLvcorMwhnrftdjXXIL1V+sZYfpRmj/e9Sd6LZdbut
         /ZLw0elwhpi9YcuPQFMXoAWqLYLLkDF3GVzkS+yKm9hNc8L8f4Sxkg+HqrEhsvcWfmwi
         8pBiYzJ5kGCr/of0iPhGp8GMiziD467Um176bHjbKM/+JgpQTfH0hXObcVTwMfm4/C4/
         ejQ5oqQo7MvNsZSHxoSVStG8APqJVOOe7LVhWV8Z0yl2hCu2OYMelKS5wSMmR3V/XQnw
         U1Ms+EMdHm85BZM7GJw6ETH44kceXt037svTxWyacdCSV6lKI1gpSIIQAa5gMkkvPXIt
         Mtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763142706; x=1763747506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbANdFo2wCpgk8SkAnrbtCfbLoz41BopBsENTnROV1U=;
        b=RFOIrkkLb60UMLGBLT5vdjNJHHQ2GCzIHrkz/HUj39ZXMDKoR1in2++v5EJEkZNB8h
         tn1cee4azc5lY3FwUyzytUuE0c7RN4a4UowRRBnvQFsh+PUiLLZ3NvtGQoX2jTdKGXH8
         kzqCLjlQThyXdrvTnx+Y0P4J7Zjk1O994eg1kW05vJJTHEqlE1gxz5K0AEnNUHMWnYW7
         fcPzgIPMwU9WQawcmtCrDLH6LNgE/cIpVA0e5OQcUEIwNcTnuB/mFUeQewoYbZyZAo5w
         qlw4vVw7rNl27vy8zz6EP0ZSDC/hPHR6p0MnG3uf2GXEpthVpNRumBPa83oaK1DBIr9P
         HdOw==
X-Forwarded-Encrypted: i=1; AJvYcCW886Om0g6tPA/CajoBmoV7RfiSu5bH+D24/tJSBFjwDHQii7a/CmEcW3B7dyT6zuGpktSQtWRgYzQ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdtr24NNWB2PClMegmZd63jaAdPS6LPP83JpLVeRHFFwVSTy9z
	1sVQ0MpysYWLpsDXuZJ0z+JTxUHDRax9huWzMZj2emfnWH5HqbzY+NbSVEjAW1JQit7p/s8Cj3y
	xj/mP9AcZtM8IAtvU/DjfsF+KMMQ54xDiteUdOF+wUwza60DMvVYjwkkSOQ==
X-Gm-Gg: ASbGncsHMVy3Sz6KvUG/pubpHnVMq3vBfBm8jJXThFLfFJWsjdd4A3VRPPDuup9Uhbf
	nRJvKUrv2E2GLU9m2/2Dn8ysUnpaMG0af39FiefGAuIjrmSDv2srWPU1IrNgDKrJPPgvPnwoAS2
	k1jND/vKZvfkPMwwBGA0vlqRh41GL8zsWJrkiJt0Flf0zWq4tzw717WGy0yvTpqjiosXRgDQcXs
	MfTtd7fznQpSM03cLpr83Unij9ZP6ucApalgiTgraTxOHXIuRrkUdleU1pspR8XTelA1JQ7Cems
	6XKRGc/txB3sFsyDnduL9OVJU04oyh9cibWnGpwq8kBDdW0Q
X-Google-Smtp-Source: AGHT+IFV7bkJGLemXcwcPYKzzcK377A1MeETkvt0ZvJ9Tk/xDGve/zptjTo4onEIW/PGf5hZTqs3VdzdO8iUFEjI7Fw=
X-Received: by 2002:a05:6512:3b0d:b0:594:2c64:54c9 with SMTP id
 2adb3069b0e04-59584205ea9mr1231072e87.37.1763142705676; Fri, 14 Nov 2025
 09:51:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114132957.33750-1-brgl@bgdev.pl> <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
In-Reply-To: <74df5acf4a8c78921a0a918331522aad997f8706.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 14 Nov 2025 18:51:33 +0100
X-Gm-Features: AWmQ_bmDa4PbnOC9pTODDHolZuuhUkWUqpR2VUAYY6n_6EMo7TdJdS33hXCwBQY
Message-ID: <CAMRc=MdFOFiZpjkec+zsx64Ww7MDhT8eSmCrFR4SparxhexX_Q@mail.gmail.com>
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip twice
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 6:45=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> Hi Bartosz,
>
> On Fri, 2025-11-14 at 14:29 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > It's possible to get a second bind event from udevd (for instance:
> > manually triggered with `udevadm trigger -c bind`) on the same GPIO
> > chip so it already existing in the hashmap may actually happen unlike
> > what the comment in daemon.c states. We must not try to export the same
> > chip twice as it will crash the gpio-manager on the subsequent
> > assertion.
>
> I'm still trying to understand the initial race, which made me to report =
the
> issue, and I now think that the patch maybe doesn't tackle the root cause=
.
>
> Initially I suspected that there is a race of gpiodbus_daemon_process_chi=
p_dev()
> against gpiodbus_daemon_on_uevent() because I thought the gpio-manager cr=
ash
> because of the same assert() in its startup:
>
> gpio-manager[588]: initializing gpio-manager
> gpio-manager[588]: gpio-manager started
> systemd[1]: Started Centralized GPIO manager daemon.
> gpio-manager[588]: /usr/src/debug/glib-2.0/2.78.6/gio/gdbusobjectmanagers=
erver.c:1128: Error registering manager at /io/gpiod1/chips/gpiochip5: An o=
bject is already exported for the interface
> org.freedesktop.DBus.ObjectManager at /io/gpiod1/chips/gpiochip5
> gpio-manager[588]: /usr/src/debug/glib-2.0/2.78.6/gio/gdbusobjectmanagers=
erver.c:1148: Error registering object at /io/gpiod1/chips/gpiochip5/line0 =
with interface io.gpiod1.Line: An object is already
> exported for the interface io.gpiod1.Line at /io/gpiod1/chips/gpiochip5/l=
ine0
> gpio-manager[588]: /usr/src/debug/glib-2.0/2.78.6/gio/gdbusobjectmanagers=
erver.c:360: Error registering object at /io/gpiod1/chips/gpiochip5/line1 w=
ith interface io.gpiod1.Line: An object is already
> exported for the interface io.gpiod1.Line at /io/gpiod1/chips/gpiochip5/l=
ine1
> gpio-manager[588]: /usr/src/debug/glib-2.0/2.78.6/gio/gdbusobjectmanagers=
erver.c:360: Error registering object at /io/gpiod1/chips/gpiochip5/line2 w=
ith interface io.gpiod1.Line: An object is already
> exported for the interface io.gpiod1.Line at /io/gpiod1/chips/gpiochip5/l=
ine2
> gpio-manager[588]: /usr/src/debug/glib-2.0/2.78.6/gio/gdbusobjectmanagers=
erver.c:360: Error registering object at /io/gpiod1/chips/gpiochip5/line3 w=
ith interface io.gpiod1.Line: An object is already
> exported for the interface io.gpiod1.Line at /io/gpiod1/chips/gpiochip5/l=
ine3
> gpio-manager[588]: g_variant_is_object_path: assertion 'string !=3D NULL'=
 failed
> gpio-manager[588]: g_dbus_object_manager_server_unexport_unlocked: assert=
ion 'g_variant_is_object_path (object_path)' failed
> gpio-manager[588]: **
> gpio-manager[588]: gpio-manager:ERROR:/usr/src/debug/libgpiod/2.2.1/dbus/=
manager/daemon.c:744:gpiodbus_daemon_export_chip: assertion failed: (ret)
> gpio-manager[588]: Bail out! gpio-manager:ERROR:/usr/src/debug/libgpiod/2=
.2.1/dbus/manager/daemon.c:744:gpiodbus_daemon_export_chip: assertion faile=
d: (ret)
> systemd[1]: gpio-manager.service: Main process exited, code=3Ddumped, sta=
tus=3D6/ABRT
> systemd[1]: gpio-manager.service: Failed with result 'core-dump'.
>
> Unfortunately, I still to come up with a way to reproduce it, it's still =
not clear
> to me, based on the logs I have, what influences it...
> (Above is really a first startup of the gpio-manager, not a restart)
>

Is this with my patch though? gpio-manager does spawn 4 additional
threads but this is internal to GLib and GDBus and AFAIK all the
processing we explicitly do in the daemon happens in a single thread.
Not sure how this would race.

Bart

