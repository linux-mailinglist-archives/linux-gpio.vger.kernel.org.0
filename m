Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F0E63BF87
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 12:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiK2L56 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 06:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbiK2L5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 06:57:41 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1105EFB7;
        Tue, 29 Nov 2022 03:57:18 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id d7so9497264qkk.3;
        Tue, 29 Nov 2022 03:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k/qaur6fm6SxJBVO5r7Os92xrCw8v3SLIgp9savh3Sw=;
        b=d7Z42eq5GdrqFaltYXs/aJ0ZCkrgNqEOowbLwW63YbElI0x3WfmWQ5VJM/yACVsj+Q
         I9ErwuJdYGTeCY6mrTOvJw4jRTFkW9114t/Rnd332V//uXZv8X9Pwuwh9KA0poQrRHkp
         Ss4ppil0s6GG7DbGTfnJ6CzXDvVobD0lIfV5Ue0AZ0zAZajpDmgNItYgX9nRjq5lh51Z
         YWncPMvWScjaB4tLicJCYPQ13rV6HaOQuEwRzA1hSVteuNrGPoy5S9tgv5R0RrMTue9k
         t5oViGiP4lq9IVXCL1gltaImrjdkIpE2bXUPEbTC8GRLvVZ5X7NCla47UY5Zs1HxGS9R
         Th9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/qaur6fm6SxJBVO5r7Os92xrCw8v3SLIgp9savh3Sw=;
        b=T9TjF9XmsMNFl+AxvB/nqzs7lxtfKnPBo2rwvu0e7YZJGSYB4F/v0OWPwnX46BxkQf
         /0rImtickjr/uiN+jxvISJbvpxX4ceVWl8gAZ0L7LXIe6BjQHUD60DvZC9/zVBb9C7P7
         tfF7e7Q1gUlxaRTprxr3fVg7pr/BmQ9qTbST+YJfxUeVWDS7vYZeJwWfrKbmsM2VHkeF
         Opb3JnTbNPTZeB+7y/EqrFdM1WtPV2rvBJl6W3FNH9u+JAmTS+DhDMQGMvryDjdBx+sX
         sIxXFMMTYAesMZNe39jBaUddyqlik26j3kuPKQXVZvxfmAv1iTCHDBfVsbEwgm27cGej
         dsOA==
X-Gm-Message-State: ANoB5pkTBOXRnXQh3l8V6X/QyXyUyQava/A1+AtfT9plrkJabhS8HBaL
        VBoK6aPkNTbYxATJnbCwik8jde37rirG1ru8OP8=
X-Google-Smtp-Source: AA0mqf7NKY01uPE5yr8p6yZosW5NXQyLzm0uprJiSd7kEqSfPgMu2RWCXA1ov/qS9/YkoMADlN0BrnHJ9cxNabHz7ok=
X-Received: by 2002:a05:620a:21ce:b0:6fa:d149:6d47 with SMTP id
 h14-20020a05620a21ce00b006fad1496d47mr33200615qka.734.1669723037619; Tue, 29
 Nov 2022 03:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <20221128214408.165726-2-hdegoede@redhat.com>
 <CAHp75VcXfh46z4m+R4bDTZbcWrqEmebzg-2gT_P+2uAYTNPoYQ@mail.gmail.com> <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
In-Reply-To: <9a4336d1-3222-fe50-f234-93ab175d606a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 29 Nov 2022 13:56:41 +0200
Message-ID: <CAHp75VdEd2-YMm2kGdRh2n7WwTJDEmOk68O4ydHU1m3W+Z83Lg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 1:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/29/22 11:22, Andy Shevchenko wrote:
> > On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> >> so that the actual value of the pin is read, rather then the value the pin
> >
> > than
>
> Ack.
>
> >> would output when put in output mode.
> >
> > I don't see it here and haven't checked the context, but the idea is
> > to check the direction and return either input (if pin is in input
> > mode) or [cached] output.If it's the case, the patch looks good to me.
>
> No the idea is to always actually use the input register when reading
> the pins, independent of the input/output mode. Instead of always
> reading the [cached] output register value.

But why? This makes a little sense to me.

> The input buffer will still work when the device is in output mode

Does this hardware support HiZ?

> and if somehow an external force is pushing the pin low/high against
> the output value then the input buffer will correctly reflect this
> (assuming the output is current limited and thus the magic smoke
> stays inside the chip).

Exactly, when smoke comes out, the hardware is broken and code,
whatever is it, makes no difference at all.

-- 
With Best Regards,
Andy Shevchenko
