Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A746776CFF
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 02:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjHJARx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 20:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjHJARw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 20:17:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815D8D2
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 17:17:51 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-523225dd110so384534a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Aug 2023 17:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691626670; x=1692231470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2gEmDU6BpmoRacI7M7xIBz1Lq89Wh0ZZyS9uvr3iWg=;
        b=sX8DMDwQMMVJrWnhzYVEGaY3G/zSA8hrOsc8QgWR0C9890Zd4Yj6rbDUGpZS+2S89/
         G++6py7yhao1XGUiOYISZMBTgOlj4gcQA+T+SsU8iHCojfI7s7ZbjTw/x90LUeowHSmx
         9wJ4hVatNa1ryQwaTIJ07g9qAzikflHtMI3K5A5U3ScdHN+3unU/VmSxaSAUX86l+jGR
         Hsg0mK908s5iuXqrDiGHhS6WJ6V6BqYGrg9BKsMH+mIVDP7XeagGBfBFiN+K9WxGltzH
         pZd54+f6rnZDFgLzkHlKmMg5d9Wu6CWhO8Y6Z/q2+cr6+gpmr4jUfC0tgxWDfiATze+9
         N7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691626670; x=1692231470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2gEmDU6BpmoRacI7M7xIBz1Lq89Wh0ZZyS9uvr3iWg=;
        b=KKu4wkz6qgFhEfqArzL1l8sfxr2npBbFG+S8GwRoTKz0g5EnH9dhXuW7n1Dv02F3YQ
         OisY2EHZ6dGYRYavmu/VE4Fsh0W4j7bQb2O3UrCBLmvqTsFfq9RJKpa0eT+ECEAIK+ju
         X9VFeJmp71qyBJWxFAVbwDFspQx7mrdIen+ZfQi+LnOsHCT7y4sNL8xZzcMuguZQTLUB
         XhXi0tDDlpdB1fwgtekaZzEBrZz2UQXfP9O+sFO33OTOIa+X9votg0q1CoNUyammGBDP
         VI1bi7ewKlvNwSuYLcHMrQRuQ8o9cdK7gZKZ9LbiMyNSB++fU87oT9GA3oDfNUc4mL8i
         VAxg==
X-Gm-Message-State: AOJu0YwHPz3V3RY7lxoNQD/JrUXiTDUkSHykyfdpMalSZ3mfMyhZBmm2
        Dl0oj5f22YDx3WyrqIOQrdSq+7fP+CeUOmrIOB7WwrBdc+w=
X-Google-Smtp-Source: AGHT+IHi6OzTBFqzRn5pPxcJtttj3a4LrCgnQ+UZDn2SK6QB4foz2YurLAkuxWOcHpyORrPwGKjviTcvCe73nM5RDYI=
X-Received: by 2002:aa7:d40b:0:b0:522:2dc0:133b with SMTP id
 z11-20020aa7d40b000000b005222dc0133bmr602067edq.37.1691626669791; Wed, 09 Aug
 2023 17:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol> <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
 <ZM7xEbr0essN2qY3@sol> <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol>
In-Reply-To: <ZM9oB0l4fvOinzLm@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Thu, 10 Aug 2023 01:17:13 +0100
Message-ID: <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 6 Aug 2023 at 10:29, Kent Gibson <warthog618@gmail.com> wrote:

> You can't statically link libgpiod until it is available as a package?

Would that mean merging the gpiod code into our codebase? Or can this
be done some other way?


Anyway, I now have it working, to an extent, but feel that there might
be a problem with gpiod_line_request_bulk_input() and
gpiod_line_request_bulk_output() if the bulk contains more than 5
lines.

My current code is here (Work in progress!)

https://github.com/LinuxCNC/linuxcnc/blob/andypugh/hal_gpio/src/hal/drivers=
/hal_gpio.c

The test input file (
https://github.com/LinuxCNC/linuxcnc/blob/andypugh/hal_gpio/src/test.hal
) attempts to configure 8 input and 8 output lines.
However, if I change the 5 to 6 in either of lines 157 or 180 then the
output looks something like:

HAL: initializing hal_lib
/home/andypugh/linuxcnc-dev/bin/rtapi_app load hal_gpio
inputs=3DGPIO5,GPIO6,GPIO12,GPIO13,GPIO16,GPIO17,GPIO18,GPIO19
outputs=3DGPIO20,GPIO21,GPIO22,GPIO23,GPIO24,GPIO25,GPIO26,GPIO27
HAL: initializing component 'halcmd9608'
smalloc_dn: shmem available 1048284
HAL: component 'halcmd9608' initialized, ID =3D 02
Note: Using POSIX realtime
before request
rtapi_app: caught signal 11 - dumping core

The "before request" line was added for debugging, the "after request"
line is never printed, nor is the error message if the request fails,
so my belief is that lines 163 and/or 185 are segfaulting in the
bulk_request functions.

The driver appears to work fine if I limit the number of parsed input
strings to 5.

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
