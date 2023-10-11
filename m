Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20EFB7C4FF0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 12:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjJKKTq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 06:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjJKKTp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 06:19:45 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA79192;
        Wed, 11 Oct 2023 03:19:42 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 961635C0116;
        Wed, 11 Oct 2023 06:19:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 11 Oct 2023 06:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697019579; x=1697105979; bh=do
        IlIC9EeuIMVa/VZ1WnSYIgbZ+zY86Stgz8IJ2yHW4=; b=ZPTus0CyEZNzQ3ZYKm
        vLTrtlZZoL2M6dMhXvw7rdMMA3wsa1FYnEACrecc2ztl1WDIhfslaXER4S5jbcgb
        hrDzBxPG1Tvy/cu/cRxuoRxOocI/ilrFu8QeXpoWTaKNDQIg7rwfNoB/TVKml2fU
        JdjYlo0AIDlLAhIOISWCEJlWzXc5Fu/bhQMwDQWXIUU/Vx1npy+zkmNn7ctCE4P9
        9Acrw62yBDVubO8PIMtRxhu2B3aYMuqwz4cxO/vWHYNlTih+fmQ+eMTvB5Sdsda2
        6ok0s4mIi74f9u92Kt8QdHWdAxfz/e46T2kOki+C/8OBV5ZCZrPIV0DBiDDkprOZ
        SkoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697019579; x=1697105979; bh=doIlIC9EeuIMV
        a/VZ1WnSYIgbZ+zY86Stgz8IJ2yHW4=; b=BlWfsK3XtX6m9FTqsj5z+1lUlMtVa
        uSmnhdJzR9VOmXkLB8Sg7CqlmHnsdQrCS9nff7eODRcC0FLRrX4dpKgs4JpDK5uJ
        ymtB7FHWWwyXprS3R33M66wU24sHYVMYG9vnBO5gKIED7l3Y71rlJqplNDRvGvLL
        XqfFxbMTUWedWoqXKeifaPqHOcDtjTfd4b0jcBJJxnylBAFyt69//H8G82sczviD
        Zc15LmU9PssJ1peroeRSsjlh/pqbKT3yiSrAaImPXAkd5Q6sZ7ucvOzT9pOLybO2
        cySWW720H6hmb/0RZrsqaCI7I5KqEdLTYCfqh7OeHbu2l+VwyWP+yIUxA==
X-ME-Sender: <xms:unYmZQET4dYl0UoyJjuZ_fB3T1xzGXWTaEpTBatGe-U2yFN3tlqJYA>
    <xme:unYmZZUZyl_2BgDDmlQsE-0cD7Q8ehnanhh1grHoC6sIKH3IjNwup37wWtGtVx1z0
    F3apLa6N32LtyOaNTc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheekgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:unYmZaIaxR6H4udLyS5OVwVlsBNx6B9mLcmyLeuDThy_R7jQ9TzNMQ>
    <xmx:unYmZSFPFX4dh4pSv2FHaQfC4fvguak-1Pdc4tFpdUO0do8tM0jeBg>
    <xmx:unYmZWUb2qBaTOgabSaKnUOm46EBwGyf30U_NflTf0hSL3j1KH3gGw>
    <xmx:u3YmZZnW7p2LztIhQz51H5hhZsTE5xhCBwF_Cy8pNMRab5eVYrtLgg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 85FC8B60089; Wed, 11 Oct 2023 06:19:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <c454503a-8f89-4bcf-949d-4970595540fc@app.fastmail.com>
In-Reply-To: <2023101126-stash-manor-7162@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
 <2023101137-fester-rerun-5c39@gregkh>
 <fe7cf585-622a-420e-8138-10de1cbca511@app.fastmail.com>
 <2023101126-stash-manor-7162@gregkh>
Date:   Wed, 11 Oct 2023 12:19:18 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     "Tudor Ambarus" <tudor.ambarus@linaro.org>,
        "Peter Griffin" <peter.griffin@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Tomasz Figa" <tomasz.figa@gmail.com>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Olof Johansson" <olof@lixom.net>,
        "Chanwoo Choi" <cw00.choi@samsung.com>, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        "William McVicker" <willmcvicker@google.com>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add google-gs101-uart
 compatible
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023, at 11:42, Greg Kroah-Hartman wrote:
> On Wed, Oct 11, 2023 at 11:30:25AM +0200, Arnd Bergmann wrote:
>> On Wed, Oct 11, 2023, at 10:57, Greg KH wrote:
>> >
>> >> It's not only the IP itself
>> >> that can differ, it's also the integration of the IP into the final
>> >> product that could have an influence on the behavior.
>> >
>> > This is for the Pixel 6, a device that is no longer even shipping.  The
>> > "final product" is long stable, so this should not be an issue.
>> 
>> The driver does have soc specific settings for each compatible
>> string, in this case it looks like it overrides the FIFO size
>> based on driver specific data and the order in which the
>> ports are probed [1]. I don't understand why the driver does
>> this, but my impression is that if we wanted to change it to no
>> longer rely on that data, we'd also need a new compatible
>> string.
>
> As I reviewed that patch already, it is just duplicating an existing
> quirk/device that the driver already supports, so there is no need for
> any "new device type" to be added to that driver, just use the existing
> hardware description in the dt and all should be fine.

The thing is, I suspect that the FIFO size override is actually
wrong for the exynos850 as well, and is almost certainly wrong
for both exynosautov9 and google-gs101:

- The driver overrides an exynos850 compatible uart to use a
  256 byte FIFO on whichever port is probed first, 64 byte
  on the next three ports, and the setting from DT on any
  later ones, falling back to 16 bytes if the DT does not set
  anything.

- exynos850 only actually has three of these ports, not
  four. It does not lists  FIFO size in the dts at all.

- exynosautov9 has a total of 11 ports, each of these
  compatible with both "samsung,exynosautov9-uart" as
  the specific value and "samsung,exynos850-uart" as
  the generic fallback. The DT lists a FIFO size of 256
  bytes for ports 0, 1, and 6, but lists FIFO size 64
  for each of the other ones.

- google-gs101 only lists a single uart in the dts,
  and sets it to a 256 byte FIFO.

- testla-fsd claims to be compatible with exynos4210,
  which also overrides the first two ports in probe
  order to 256 and 64 bytes respectively (like exynos850),
  but it only has two ports.

- artpec8 has a separate compatible string so it overrides
  all ports to 64 bytes.

I don't know why probe order would have anything to do
with this, so most likely these are all the same thing
and should just put a fixed FIFO size into the DT for
each port instance.

      Arnd
