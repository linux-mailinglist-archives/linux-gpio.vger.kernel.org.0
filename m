Return-Path: <linux-gpio+bounces-4982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E8894E7F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD9F1F23D35
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3675B57876;
	Tue,  2 Apr 2024 09:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AxrmFDKu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74FC57306
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049518; cv=none; b=MqH9k5fO2qjwD71duh/B+C9gqH1Fv843OB8tDK7+E/CdNu7hLIY02/5MJ4VlYIRkspu2LopFPhF8Cm8zfdxQjxjh+xYmnmPZFSwUx5c6zqN8RzkdzSHiZ9UEArS3njS+weoQVtTjUdbbvuBi3KLo01WFXLG5ztZcxBPhCYS/3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049518; c=relaxed/simple;
	bh=o/P8asTQgXNr+LtSR/rVKgTHlr8EJ1cZ5yL0HTpm700=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bSJoWQfsxz6obKqaCe7km8r4WmVRC8VOYjKGIzuqvWmeHJ5p80j+UQuTLaQ2E4QC5GEXG2kaBA+TDBJNFDKN5zxCRe6IOo6cJn98rJ99qp9veKz0P1Wva1JDdTeKePi0UCbQ0Y1gpzpdJq4UgYToF+WHeEQLth8zUf1XgToMux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AxrmFDKu; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e074f8ac06so1390422241.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712049514; x=1712654314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r66TFNSLT4YD94GnwLNWPiQzwjcsChSUIFxq6D9Qnwo=;
        b=AxrmFDKuEdTLStgKfjFi6XG/w6/Uo+d7xgk2Jv/eNzzSaOI5HZooT+s6XC6c9A8+vV
         MctSlMidQO5CCBt1iqe+v8o3JDZlL+zi5qVEV97xoKp/cKNH5M9WAZQrkKkxtKpMQ9io
         Qv2/ni4yxcSkB1jXZaJtNQda75GmmmMW3zIABphAzaePbvUHqROUHvLrxUb3G01euL7q
         f98/HPNaLnAP+bPmHuNKuCMPan7Q8dhEo6lNSXIHux82u4naymLEALvEaqHOlQZ3lLKM
         zfM3w1t7ZoTSuJYMfEIYNcLSAxfxYpXm9YQ1YfMAMrcc5XO/mr1MiCvv0AvbqPvYoHz+
         lZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712049514; x=1712654314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r66TFNSLT4YD94GnwLNWPiQzwjcsChSUIFxq6D9Qnwo=;
        b=TunzbhM8w9WfXljQ8z+4AAMU7uTftMIobzjwWYnawuztd84AsRzshlxZ+SOfBWmLAD
         c0LSsEN1d+5c534X9oosINHeUx1Zmm+0QK4d/0YobCYAKeSNaSXp/KLhz+0FZ/EoXP1G
         4q7Nf5dy6kQWz+2+edRlEVehNZyBMtpmKIMLyPdYWemFQS5KoibKGsy/XVuck7QslwTi
         Y+yijDIB6hWFV0yqo1+EpxlY8wWFD9aTK3peSMSgnPRIjQIlnDv44SRlETtkiRY6WGyv
         e7muVF7jtPXs/22SZX6wMpifN3KHB6CphhLd/rNrFiVpv4/O4fFOdUhHtMjCoY0LV6IZ
         gFtg==
X-Forwarded-Encrypted: i=1; AJvYcCVgZb0Rq0XYazZO1ciJo7hjxnfUquUPnj435HXGeXxzShXmufIqxg/OQRAF+WQS1HDYhBikQzqj2fsCqn5fj2W3z1gJd/4ivnv/6Q==
X-Gm-Message-State: AOJu0YyZpPPHCk3EQIhqOrley/jodnkk/8q6a/WwFVV6a9LIoL+febpu
	GslAQwmcN6UTZz/c9EymoSVDhp5UQLcHObLnrmVcnlwsnzQr4qCUDt08ngPqj6FqpRCyeYJIFB6
	pZyBpwPlXUKqn8YkrkWivUa/K2vQZSGKSa/+FfQ==
X-Google-Smtp-Source: AGHT+IHQ73nyKalKwygD4j92nMTrgX97gI21W8eoJIJZkooD2dfv2lbsfKe7svLrUcejklRdqZgrt81nkzCspg1NleI=
X-Received: by 2002:a05:6102:2459:b0:475:111d:c0dc with SMTP id
 g25-20020a056102245900b00475111dc0dcmr8809724vss.14.1712049514705; Tue, 02
 Apr 2024 02:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401152547.867452742@linuxfoundation.org>
In-Reply-To: <20240401152547.867452742@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Apr 2024 14:48:23 +0530
Message-ID: <CA+G9fYuiYQk8FrF=1kvMW-7jeNskkL309+3qtmgoMjF8KMQnxA@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/396] 6.6.24-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
	broonie@kernel.org, Anders Roxell <anders.roxell@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Apr 2024 at 22:06, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.24 release.
> There are 396 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 03 Apr 2024 15:24:46 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.6.24-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
Regressions on arm64, arm, x86_64, and i386 with libgpiod tests.

libgpiod test regressions noticed on Linux stable-rc 6.8, 6.7 and 6.6
and Linux next and mainline master.

Anders bisected and found this first bad commit,
  gpio: cdev: sanitize the label before requesting the interrupt
  commit b34490879baa847d16fc529c8ea6e6d34f004b38 upstream.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

LKFT is running libgpiod test suite version
  v2.0.1-0-gae275c3 (and also tested v2.1)

libgpiod
  - _gpiod_edge-event_edge_event_wait_timeout
  - _gpiod_edge-event_event_copy
  - _gpiod_edge-event_null_buffer
  - _gpiod_edge-event_read_both_events
  - _gpiod_edge-event_read_both_events_blocking
  - _gpiod_edge-event_read_falling_edge_event
  - _gpiod_edge-event_read_rising_edge_event
  - _gpiod_edge-event_read_rising_edge_event_polled
  - _gpiod_edge-event_reading_more_events_than_the_queue_contains_doesnt_bl=
ock
  - _gpiod_edge-event_seqno
  - _gpiod_line-info_edge_detection_settings

Test log:
-------
ok 16 /gpiod/edge-event/edge_event_buffer_max_capacity
**
gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait_tim=
eout:
'_request' should not be NULL
# gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait_t=
imeout:
'_request' should not be NULL
not ok 17 /gpiod/edge-event/edge_event_wait_timeout
ok 18 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detec=
tion
**
gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_events:
'_request' should not be NULL
# gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_events=
:
'_request' should not be NULL
not ok 19 /gpiod/edge-event/read_both_events

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.=
6.23-397-g75a2533b74d0/testrun/23254910/suite/libgpiod/tests/

--
Linaro LKFT
https://lkft.linaro.org

