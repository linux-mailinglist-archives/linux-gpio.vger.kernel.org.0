Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1A0781026
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 18:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378474AbjHRQSn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 12:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378565AbjHRQSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 12:18:16 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F5E30E9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 09:18:14 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 143AB320095F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 12:18:09 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
  by compute2.internal (MEProxy); Fri, 18 Aug 2023 12:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:content-type:content-type:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1692375489; x=1692461889; bh=tiLrdKNxB9Ie3Vhk/xjZaqCdp
        iVCabJUfJ/RlfRigkc=; b=tiG1PHWP4A3RzpTa85W1dORXZWLXvYwVZEKC8l8YF
        RXrj/3JoSyj4BmGUNY4Ni9MZ3oTMca5NSrN65fY/mMQZEk0X9a3qN/hHOf5G/jMN
        rWcnd23aUugXeLHdi/hmT1bD5RSbcOjWSWUuI6aJlJweh4ITOo4xJD4SkuApvW86
        p7nZ31pnKSFc/vJKkO0pon3Gxc2vJy4vT7lwpekGFy8NZYL68slr4AfIOTLqTKxK
        VtfqJfW/DUKwLtfW+9Anm7GcEZhyh5OAPRlTFktRVi8cVUswe1IciNSYcgpwL5/U
        e+TOg4qY8yQTWn2tXbBZZ8Jb+kTn4h6O9KDbuYJI1m6HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1692375489; x=1692461889; bh=tiLrdKNxB9Ie3Vhk/xjZaqCdpiVCabJUfJ/
        RlfRigkc=; b=hFVdGpI1Adjcb7CvZ68O0QK2jmrD06AJH4HtHNpuX8oP+NCQl4e
        Of35N35qCCOeQdqPZqbl3DImVsm+EyuTS6q4zs8Y86dQUKTfOP033fHj6JQ2WPZM
        UPrKUcXAiTi+/Hz2Mjn3Al9CIGF6EgmsThnnHARow8n3UVb7u6hHqLuF9LZibm+X
        qsbJxwkVQZJc+N8qEGIumqYBYH5uyDCK4hBsA6OJSJlU5qaw56FxpkOAgL54cfvM
        1pfsYhCJT1bQtX1II5wmmyWH/TXlK0knDmRrhvMvsxuhtDFRwZqfUlBCw+QcVaVa
        omO4IFIb1S6ZpiNju5CbFDhFZQzDsKuKTDg==
X-ME-Sender: <xms:wZnfZHYMow7bivnKZYk8ugyxV-Ai8CCq67KqJO8dlwKbGeqkei8kQw>
    <xme:wZnfZGZuXNFv9rHYSPUxKFmebjwSJug1AotuDvVvOmEBBe26ONDn7E7IIx1eKJz8r
    8vkGA08OA1uLnm1uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddufedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdetlhgvgigrnhguvghrucfkvhgrnhhovhdfuceorghmihhv
    rghnohhvsehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfduvedvvd
    eggfehudetgfevhfeuuefgtdegvdfggfejueeihfejteegffefjeelnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghmihhvrghnohhvsehfrg
    hsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:wZnfZJ_98mC5X02YAormciuUwvq_9ohMXt9JC5bLbT6qZeaoI3XbKg>
    <xmx:wZnfZNpCyoxCwiFfABIPcaPJzZhuHYF2nSlGmbg6vDQLBBpJNuM7kA>
    <xmx:wZnfZCoXapPwrC9MG58BXurzgOurKNgxy38zh0Qdkxt9aZgHhUIhuA>
    <xmx:wZnfZP1PIMuID3vEk_U7icsnyewU7mDyOzGiKmPaGHg92vMP8RQcRg>
Feedback-ID: i30c842cc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4CE11272007B; Fri, 18 Aug 2023 12:18:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <4bfea609-96e7-4b81-9855-09f571dec8bc@app.fastmail.com>
Date:   Fri, 18 Aug 2023 09:17:48 -0700
From:   "Alexander Ivanov" <amivanov@fastmail.com>
To:     linux-gpio@vger.kernel.org
Subject: gpio-it87: gpiod_get*() always return -ENOENT
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Appologies if submitting to wrong list.

I am developing a driver for PCIe-based device that needs to receive external signals through on-board GPIOs. The target platform is Intel-based board and running Fedora 34 kernel 5.11.12-300.fc34.x86_64 and has GPIO devices driver by gpio-it87.

# gpiodetect
gpiochip0 [INT34BB:00] (312 lines)
gpiochip1 [gpio_it87] (64 lines)

8 of available 64 lines are connected to a header on the board:

# gpioinfo 1
        ...
        line  49:  "it87_gp71"       unused   input  active-high
        line  50:  "it87_gp72"       unused   input  active-high
        line  51:  "it87_gp73"       unused   input  active-high
        line  52:  "it87_gp74"       unused   input  active-high
        line  53:  "it87_gp75"       unused   input  active-high
        line  54:  "it87_gp76"       unused   input  active-high
        line  55:  "it87_gp77"       unused   input  active-high
        ...

These lines are verified with logic analyzer and `gpioset 1 nn=0|1`

The PCIe device driver defines these lines as:

static struct gpiod_lookup_table gpio_it87_gpios = {
        .dev_id = "gpio_it87",
        .table = {
                GPIO_LOOKUP("gpio-it87", 48, "it87_gp70", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 49, "it87_gp71", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 50, "it87_gp72", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 51, "it87_gp73", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 52, "it87_gp74", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 53, "it87_gp75", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 54, "it87_gp76", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("gpio-it87", 55, "it87_gp77", GPIO_ACTIVE_HIGH),
                {},
        },
};

and then adds them to lookup table, eg.:

gpiod_add_lookup_table(&gpio_it87_gpios);

However, none of those lines are available at

struct desc *gpio = gpiod_get(dev, "it87_gp70", GPIOD_IN);

Above returns -ENOENT for any of those lines.
I believe it is due to incorrct lookup definions in gpio_it87_gpios above, however, I cannot figure out what is wrong there. 

Thanks,
--Alex
