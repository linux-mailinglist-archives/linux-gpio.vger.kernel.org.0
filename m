Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E557B5728
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 18:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbjJBQAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 12:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238340AbjJBQAv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 12:00:51 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BCCB4
        for <linux-gpio@vger.kernel.org>; Mon,  2 Oct 2023 09:00:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9adb9fa7200so732221966b.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696262445; x=1696867245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+6tSuZGsJ8MLmUkhQ/q6aX6p0H5mimnkA642RTbylo=;
        b=f4C2hTxCkxrb0R0Kf8tOr/+7s4xgm5l92EIxycloLqEtyB+khxf7KP9LlTybOhMCHQ
         qmoAhWw//iNt1r552BPZgpn8RM4WFEQmko/AOk5RtLRoFt5O0aBs0FW/JqG3wGTbBFdF
         yFfNiTdfe1/EUZYZQ4dWnXPdlEKjv0SanoRig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262445; x=1696867245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+6tSuZGsJ8MLmUkhQ/q6aX6p0H5mimnkA642RTbylo=;
        b=cwCefM1G69dj43IFPSyFEr6zPvEgsKdXZP8uMMBzU8ZyShgWpnKd2tQrSk6KrAFzAR
         hr/v9oCQ8eNtxng8xDBPx3znjXnk/aNAxbIFlVnun1/NI7Hwf7kUgQ2lhFdeJNW9Loli
         3jy5b581NJSYNXnhGT4VAhQIrWGQuoqLVH4YHMP+k3VuKuknZPPlY5El35crusj1Ngf+
         Giwp8/c5ChfZhGfc7LZYbS292evv21tVpteySWbvAaVfGouAj9QoFQOgBM/q1yWrbce4
         I0hLu5rGK+QQkIT2lFRzLkzIr6K4jIDHKNEYaOobUocOJbPFKyajNg0GPmFIMvZ5mSkU
         bPkw==
X-Gm-Message-State: AOJu0Yyu3cttSiAyDAAVVkTuLY6grptOx07pr5tU20yiLGvSH1NuhXni
        F5DJOJsUw/2eFMcVu4qSSA4xznErPOva/u0HHR1HVZuO
X-Google-Smtp-Source: AGHT+IFL8+DydZh+Xc0qGSdAy3Nkg7sls9fF00VyM7Oaor47i64VPX/vQ8lmsmh/pC8/it/ZLFo77g==
X-Received: by 2002:a17:907:3e12:b0:9a5:7dec:fab9 with SMTP id hp18-20020a1709073e1200b009a57decfab9mr61114ejc.9.1696262444944;
        Mon, 02 Oct 2023 09:00:44 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090670c500b009a13fdc139fsm17155756ejk.183.2023.10.02.09.00.44
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:00:44 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso14916a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Oct 2023 09:00:44 -0700 (PDT)
X-Received: by 2002:a50:9b19:0:b0:522:4741:d992 with SMTP id
 o25-20020a509b19000000b005224741d992mr156294edi.4.1696262443982; Mon, 02 Oct
 2023 09:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230918125851.310-1-johan+linaro@kernel.org> <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
 <ZQlIveJVdvyV2Ygy@hovoldconsulting.com> <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
 <ZQqemN8P2VKgxhsV@hovoldconsulting.com> <CAD=FV=XK87TZuPy+d2r2g5QhowmghE-m9pGHe9-X7jnXAw9z1g@mail.gmail.com>
 <ZQ1Zm6ec9NuBvqpl@hovoldconsulting.com> <CAD=FV=USBJRzqxX9kBP8pp4LKRGpBee+jkHL=KmeQvyfBk2CVQ@mail.gmail.com>
 <ZRqzGA1F6JV-mlRL@hovoldconsulting.com> <CAD=FV=UHEeu3crTFEZDY+LDQZk07H8un7gCSs0jyCQJrGYkV=Q@mail.gmail.com>
 <ZRrmVN3Rbz9PY8FW@hovoldconsulting.com>
In-Reply-To: <ZRrmVN3Rbz9PY8FW@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 Oct 2023 09:00:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcUKPezcp2dUQHW2vhrvvdo9=GSAOeML1JPLhEyG3WqA@mail.gmail.com>
Message-ID: <CAD=FV=WcUKPezcp2dUQHW2vhrvvdo9=GSAOeML1JPLhEyG3WqA@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: fix handling of unpopulated devices
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LinusW <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Oct 2, 2023 at 8:48=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> > In any case, the fact that there is a shared power rail / shared power
> > sequence is because the hardware designer intended them to either be
> > both off or both on. Whenever I asked the EEs that designed these
> > boards about leaving the touchscreen on while turning the panel power
> > off they always looked at me incredulously and asked why I would ever
> > do that. Although we can work around the hardware by powering the
> > panel in order to allow the touchscreen to be on, it's just not the
> > intention.
>
> I hear you, but users sometimes want do things with their hardware which
> may not have originally been intended (e.g. your kiosk example).

...and they can. I don't think it's totally unreasonable for userspace
in this case to take into account that they need to keep the panel
powered on (maybe with the screen black and the backlight off) if they
want the touchscreen kept on. If I was coding up userspace it wouldn't
surprise me at all if the touchscreen stopped working when the panel
was off.

I will further note that there is actually hardware where it's even
more difficult. On the same sc7180-trogdor laptops (and others as
well) the USB webcam is _also_ powered by the same power rail. When
you power the screen off then the USB webcam deenumerates. When you
power the screen on then it shows back up. It would be really weird if
somehow the USB webcam driver needed a link to the panel to try to
keep it powered.


-Doug
