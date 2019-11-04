Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8409DEE3B2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDPZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:25:05 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38682 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbfKDPZF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:25:05 -0500
Received: by mail-lj1-f195.google.com with SMTP id v8so2425770ljh.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaEPIoS2t8hUZV5j+rbrQAWA68wAJcFqrHD13iQZNVQ=;
        b=s1TIVkFrUgUqgiD/eCRPacD4FbkSkrQplNYQ/fhkXZtJHcKc0SOQG/Uqx1uWBOWTIk
         wGjwq+fupT6LcupwghxWtbONfk4yQpKCtZexO2I/4c1nESvOL6MUcxGXqA20Y9hZjAsj
         yKavZOz+rt+j7ocQUbzsnqU9SoPZb/b0kojChjUxJ1nJaOfzn+9ssmC9a8WlEP9L6c/u
         ossTO6WbRm6o4ZbJSRi+E+g+Q2oh4wyvy2uzYOMCmT2xcIhm9Nft9IAUjWzNRpXTtI7Z
         NGguI0b+9fDPYA8DPF17kXRvQG3BfLAT9xYJnRA+IAdq+pfwkg9FE0tmVObk8z98ptkd
         NfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaEPIoS2t8hUZV5j+rbrQAWA68wAJcFqrHD13iQZNVQ=;
        b=m5pTpQ37OfXYgRILjG+4Y35Zy7wNsbsyk5kMbqcmFo6lE2eu4+5jFaZSgTWSxNbj75
         I4xR7zu3dPYWt2+AWLb2aNoQtiiTyxghcF9RCmlm4KEPHPBLgzfkgm0ZGVCPd0KZXt+y
         MCC2QYEuDghUDBKYrJp9lbdZ844VHlg/3ONoJObG/JCO/Lxj1Ce2Hzb+UPETvan9YsdK
         zXzM/dug/RXSzee6Pssl3zAIYWBDelZMrZYitWz5+IB71OkeKLPnpqZ3nyyXPgMCCdAn
         Tm48uAfGrM851czr1LyPrF+9MwS/OWc7rJ4jyaSnx1kYfDd3rdFDOrgsiFAZnorkiLXm
         k2Yg==
X-Gm-Message-State: APjAAAUhB3r8nTp70TkCQYPRfL+l003uslO3CYqjJWc/h7WoHLO3//ao
        Grz6sFj9XisZk7wAMn6eeqFMr4f/72T9l3t+wFLEFQ==
X-Google-Smtp-Source: APXvYqxzvhxQEC2lVXS9XLU/+X6UlgEVhaZM82+Iw9teO/FERLxOvAN0X//SI7N3tlH1MqOFaHplMyQGcIb96hV7Nrw=
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr19270245lja.218.1572881103566;
 Mon, 04 Nov 2019 07:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz> <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191104001819.2300-3-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:24:52 +0100
Message-ID: <CACRpkdb530Do3BnVBA6Q7TWOQ0_QfytqaPHPXCPoZP_742Rvzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pinctrl: bcm: nsp: implement get_direction
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 1:18 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The get_direction api is strongly recommended to be implemented. In fact
> if it is not implemented gpio-hogs will not get the correct direction.
> Add an implementation of get_direction for the nsp-gpio driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

BTW I think it looks like this the GPIO part of this driver can be
converted to use GPIO_GENERIC. Compare to other
drivers such as drivers/gpio/gpio-ftgpio010.c.

It's a fun way to cut down lines if you have time to check
and test!

Yours,
Linus Walleij
