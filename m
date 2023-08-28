Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8732078BB5F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Aug 2023 01:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbjH1XLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Aug 2023 19:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbjH1XLa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Aug 2023 19:11:30 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46344199
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 16:11:27 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id C192E32009FE
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 19:11:24 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute2.internal (MEProxy); Mon, 28 Aug 2023 19:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1693264284; x=1693350684; bh=kO
        rvlIau6H9GZuMH4qmvA/1ss7hhG246erMpRPTT0qQ=; b=uEKr9zEHjBKpLe7hqK
        C6CbGaf84hGG2BWbT3ykpjyYO6p4nUJKuAggTPpSW1kmt2VjgrVgRi5ySlGSzsWK
        TxB36jsbeD2ZLnHO0wWNvSqp8lybTFTSkeulGFeE0Sx0Dzbsj+aKOfMaCqgI5a6T
        xHralqPIfJcOHZwZ6IJtRljwE6jLWH4Ekz+mP6/587hlSlCARJofoqu2e4sDAb96
        O6p+Kmc6uImnFhZ2skaDAAQWmTrvK3PWCozFmNEEwRCOyqljI0RR8U+RdKvAU9D2
        Yj6w6k4I4ts3Gb29B2DUr5KaqodqI0sSweT1nqACgR8Rxw3fpiSDAPUBJll8YnCy
        Op3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693264284; x=1693350684; bh=kOrvlIau6H9GZ
        uMH4qmvA/1ss7hhG246erMpRPTT0qQ=; b=E1w02QTL0ojYjflHDmbbtNuT4X4DA
        bjIxu4IdYNUD+ygYkShFrB2dLoJAqyijD3au/3zDkf4bBhsVgLECL8JJszkazHcy
        GgQKFfrsTA1U1CW3jd9kbVICCAhKX5D5+xZn6mfGtV740xR0/4uEP/9AHNgqFxZX
        V0J2Bk2SXagQ9Jql+tIAtA/iU/TEDIAXmdDFWOcp6dd3llDN1C7CsCoArKmZlPa9
        QtAl2uhb3URo1M3Y+kW8G33UOcL5D6c7450p7s7eqXhNlgzZYy+SfJRm36KYf4td
        NtXdIvFsJSvpb3I8HZE7PgsBSOPeFVen1TpGtU8oDqoLlJUwsYTCVfP/w==
X-ME-Sender: <xms:nCntZF7b8ElzrgS4DsvEM-P21OFUG_e2IRQHsZtC8hp8txvDKMjtJA>
    <xme:nCntZC73QecM3GseLSMoXM7cs-hj-rfqei7K-jQjZi6OJQTYhnQBxKXqMvfS4OW0o
    ILDMRWQnng9d2vtzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudefhedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehlvgigrghnuggvrhcukfhvrghnohhvfdcuoegrmhhi
    vhgrnhhovhesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeevleduje
    eitdefjeelkedtveegfeffvdevvedvkeffjefgudejteejgeeigeeiteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrmhhivhgrnhhovhesfh
    grshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:nCntZMfq8XRS3VfEwXK-jCsgyXqiAEv9ut6fzvy9u60yXdgAxWo4jg>
    <xmx:nCntZOIsR2oJwDPUdoezsYd7epzqh3ov_GfnV1CToF9Yj50qFNsUIw>
    <xmx:nCntZJLsPMsO6G-kUCG6lE3qYZLF7BcN_rEV3HtUR7buCweMpkSR3w>
    <xmx:nCntZOUTMsMaWC0M0cUiFFIgDRkCvJFKXI0wu8f4Bk-_9Iya1jwq9w>
Feedback-ID: i30c842cc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0B881272007B; Mon, 28 Aug 2023 19:11:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-701-g9b2f44d3ee-fm-20230823.001-g9b2f44d3
Mime-Version: 1.0
Message-Id: <4f58a027-3bdd-46b9-8385-f902f251aeba@app.fastmail.com>
In-Reply-To: <4bfea609-96e7-4b81-9855-09f571dec8bc@app.fastmail.com>
References: <4bfea609-96e7-4b81-9855-09f571dec8bc@app.fastmail.com>
Date:   Mon, 28 Aug 2023 16:11:02 -0700
From:   "Alexander Ivanov" <amivanov@fastmail.com>
To:     linux-gpio@vger.kernel.org
Subject: Re: gpio-it87: gpiod_get*() always return -ENOENT
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 18 Aug 2023 09:17 -07:00, Alexander Ivanov <amivanov@fastmail.com> wrote:
> Hello,
>
> Appologies if submitting to wrong list.
>
> I am developing a driver for PCIe-based device that needs to receive 
> external signals through on-board GPIOs. The target platform is 
> Intel-based board and running Fedora 34 kernel 5.11.12-300.fc34.x86_64 
> and has GPIO devices driver by gpio-it87.
>
> # gpiodetect
> gpiochip0 [INT34BB:00] (312 lines)
> gpiochip1 [gpio_it87] (64 lines)
>
> 8 of available 64 lines are connected to a header on the board:
>
> # gpioinfo 1
>         ...
>         line  49:  "it87_gp71"       unused   input  active-high
>         line  50:  "it87_gp72"       unused   input  active-high
>         line  51:  "it87_gp73"       unused   input  active-high
>         line  52:  "it87_gp74"       unused   input  active-high
>         line  53:  "it87_gp75"       unused   input  active-high
>         line  54:  "it87_gp76"       unused   input  active-high
>         line  55:  "it87_gp77"       unused   input  active-high
>         ...
>
> These lines are verified with logic analyzer and `gpioset 1 nn=0|1`
>
> The PCIe device driver defines these lines as:
>
> static struct gpiod_lookup_table gpio_it87_gpios = {
>         .dev_id = "gpio_it87",
>         .table = {
>                 GPIO_LOOKUP("gpio-it87", 48, "it87_gp70", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 49, "it87_gp71", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 50, "it87_gp72", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 51, "it87_gp73", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 52, "it87_gp74", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 53, "it87_gp75", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 54, "it87_gp76", GPIO_ACTIVE_HIGH),
>                 GPIO_LOOKUP("gpio-it87", 55, "it87_gp77", GPIO_ACTIVE_HIGH),
>                 {},
>         },
> };
>
> and then adds them to lookup table, eg.:
>
> gpiod_add_lookup_table(&gpio_it87_gpios);
>
> However, none of those lines are available at
>
> struct desc *gpio = gpiod_get(dev, "it87_gp70", GPIOD_IN);
>
> Above returns -ENOENT for any of those lines.
> I believe it is due to incorrct lookup definions in gpio_it87_gpios 
> above, however, I cannot figure out what is wrong there. 
>


Any suggestions on how to resolve the problem?

Thanks,
--Alex
