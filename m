Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C1E79BA4
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfG2V5b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:57:31 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46628 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbfG2V5a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:57:30 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so38868942lfh.13
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhB+RZ2P4weNNxlV3JiaH27Cy16VoQbodVkM+yi6FAA=;
        b=sVE9zpEAJSM4jgNF+JxW1v7N1fcEZmKVkBwXW6KNsVWmVQFLHqD9d+xWPT9I2jAv7d
         TWVaNyRqpnOg3/0m2gk7Ch7jfca9Jh7XmgTvTp/mhbO/osy8RPidS52ZbciVLnLEwdVN
         13aomLVoHqKP8mi75hzRriyJh55sc4+nlArQq/OmMsDigdVM12/m5kKoc0QeQ0A/N+rn
         uT5q2dRFCTZxrWDs9LEKNvSy227d40I8Q4tKWwgJf09KBFWvYLj22dKO7HSBJthn38/j
         qYBSQpexpirObv7xVzyDVw0nZYVjTHFYX1mCs0JG/ZipMEBdkq6//TrU3cy7vGuxUxj1
         Nt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhB+RZ2P4weNNxlV3JiaH27Cy16VoQbodVkM+yi6FAA=;
        b=WeR3Lqa/n1l6idjMomi76ABDkrDJSukWaTt7pbgEq0jutAaNcuitHC4qCrC3VQ/cK8
         VyJQZ+DIRIfsR8UIIzeacRHF5/7V9dW7WSn6b0oevonuUD0iWy4aD6foMOVfNR1x0cGG
         R9jCQhkmUODR1rqsgownFHRvRJPUIxnGk8eFHXt/nUL0eDef8GX4CrPQs5mbpAKIEQin
         tujGCZp2CZvHcm/+NnEdEkkjKdJUdTsd0IPeoJr460o1r1aEN/t7RrFCY+ZAw5yT6lSg
         IV1uGFWTbSql13Ua/hdUq0243WvPdt8VOKY/JoVBfRXVWhDGi8YxyQuwfKzuQrZabgdl
         FPWA==
X-Gm-Message-State: APjAAAX7M2XMqld7c4Jm6BC1TcXebgSRaZ8nU4cO5n0sRc9NJROO1rH4
        mkBalB1Pi2bSCJnFnNc6Qz8DTfDyfQjx+f7+NvOFow==
X-Google-Smtp-Source: APXvYqyBnwkv1VRTZGXZco57yirARpTFLPJRJ/RvgElvK8IXTHcFCH30jet7L01e4aA0VROLzr8OPXOGn2X/EdVc1D0=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr54444437lfc.60.1564437448905;
 Mon, 29 Jul 2019 14:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com> <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
 <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com> <CACRpkdZxsF9gQj0VicVLsPKXg6rKA1mLwbywmazOf0w8PLnOfA@mail.gmail.com>
 <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
In-Reply-To: <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:57:16 +0200
Message-ID: <CACRpkdZcLNe+oM1jWPpva0LECc-P48ab3H-kG7eabMmSvmvioA@mail.gmail.com>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Hongwei Zhang <hongweiz@ami.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 2:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The behaviour is to periodically emit the state of all enabled GPIOs
> (i.e. the ngpios value), one per bus clock cycle. There's no explicit
> addressing scheme, the protocol encodes the value for a given GPIO
> by its position in the data stream relative to a pulse on the "load data"
> (LD) line, whose envelope covers the clock cycle for the last GPIO in
> the sequence. Similar to SPI the bus has both out and in lines, which
> cater to output/input GPIOs.
>
> A rough timing diagram for a 16-GPIO configuration looks like what
> I've pasted here:
>
> https://gist.github.com/amboar/c9543af1957854474b8c05ab357f0675

OK that is complex. I agree we need to keep this driver together.

Yours,
Linus Walleij
