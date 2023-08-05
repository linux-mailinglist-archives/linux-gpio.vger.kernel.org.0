Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBAB7712F6
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Aug 2023 00:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjHEW4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Aug 2023 18:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHEW4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Aug 2023 18:56:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD171732
        for <linux-gpio@vger.kernel.org>; Sat,  5 Aug 2023 15:56:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bf9252eddso486601366b.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Aug 2023 15:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691276181; x=1691880981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rVEc+zvpdJbHdmR0vAkVZx6AXQ08DzE1Au0tsEbHCk=;
        b=WqsDPyEUdKrno97k0JByYS1LFaq3JFASbUZ2afOsc00uaWIDL40oYmt5Pq2jN0vEOV
         CjX9E3EEaBBeIZZyLBgi/FwKTNl4WeEY/bTWRLEycVs+Da/qkUTpt2SX6cuhAIm1rtZ5
         X8MPyCgVw6GrFdPdEV5iamiNo0025ZW4ajowTtvs6in5sTLnHcPPW+VS3NYhP+S6F7+w
         FZtkTm71dlM+4ODIX2c0DnaWSAhNYH0e0Ql+VQQTGY7M4O+XxNvG+9vAMPq/LRb7NK7r
         U29RV2qCnblRMM32pVUagVGPkqQiAlpPvE3PSI2Emicsf1qUlsKxrRzE8g6VxjvUSMH4
         pbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691276181; x=1691880981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rVEc+zvpdJbHdmR0vAkVZx6AXQ08DzE1Au0tsEbHCk=;
        b=FfIug4t1YA76lZYOtW2UmK3quEf96WTgSAwe8e+KkRg+8XGErnAqM1r8WmXv7z8Snn
         Wjykrvo404U+Ovo9FHm4ilQ6klF7lYAbQYrLrYBA3rN00n2xB/6khfRs97utDy7FK1GZ
         mgsnOZQo75od7ubOyO3XtiGJMeWRt3HNVsc+ztpgVDi1XJYMfaONNwLfSYEzzHAacAXX
         UdQXK+bxauBr+e/bI7fqdZMGz0OgTWcc4kAZ+4uyKsP9RG4y3+q9c1nLnay8brYRLps5
         +bpltf2lhvRHEFHPoR18I0DIjTzqRvlhhYzs+jSeV4SpO8tMB75SSaFvX+cF81xKwk/2
         H8fw==
X-Gm-Message-State: AOJu0YzJZUhYpjNTHtvbttNIuGFQOPdD06xfUFJKp7IBJCb1oDw0g1Rb
        Bg7xAtMLg7iIlYSazgJ5kWlADlaBT3aV1Zw7HP70di8tqsI=
X-Google-Smtp-Source: AGHT+IGU9viCRNc9tvX7Kt43S8Goc7j8o/K8ki4KQyr1cZpGEDfpqEtpqLaZpznO0wZGuRRMjbjMP37BxrCCDDcsCZk=
X-Received: by 2002:a17:907:2723:b0:99c:1ed1:65b2 with SMTP id
 d3-20020a170907272300b0099c1ed165b2mr4194468ejl.33.1691276180845; Sat, 05 Aug
 2023 15:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol> <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol> <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
 <ZMRzYD6wGYywiPbd@sol>
In-Reply-To: <ZMRzYD6wGYywiPbd@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Sat, 5 Aug 2023 23:55:44 +0100
Message-ID: <CAN1+YZW-EcQq=D=dLQoH-WsDD7RWjTUgqbQMynV+OXV0EjLOAw@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 29 Jul 2023 at 03:03, Kent Gibson <warthog618@gmail.com> wrote:

> > Unfortunately I won't know what chip the line is on, but I have
> > already considered that and plan to have an array of structs
> > containing the "bulk" and the "chip" for each chip that is needed
> > according to the IO line list submitted by the (pesky!) users.
> >
>
> So the IO lines are specified by name?

Yes, they are.

Before I go too far down the wrong path, it has occurred to me that I
probably can't allow the lines to go out of scope?

ie, this (pseudocode) won't work

for each lineName in lineList
    temp_line =3D gpiod_chip_find_line(chip, lineName)
    gpiod_line_bulk_add(&bulk, temp_line);
next

As each line in the bulk will actually point to the same (last found) line?
Or am I missing a subtlety?

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
