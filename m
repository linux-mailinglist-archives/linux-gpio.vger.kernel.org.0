Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3AE50E964
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 21:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244911AbiDYTVm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 15:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238212AbiDYTVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 15:21:40 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131061002D0;
        Mon, 25 Apr 2022 12:18:36 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id C83CE320210E;
        Mon, 25 Apr 2022 15:18:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Apr 2022 15:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=living180.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1650914314; x=
        1651000714; bh=QuL7hD9lSS+3BNz+K1mxWsAN4KCiWLNaSadaO01tNb0=; b=g
        m8ppf9qJD1qshNcaNdEJNskrI8EbVkfZOneFABn7TH5DiHTBsFTGnTE/Q0iI9Auw
        i59FxPYbESRgFwce805YaBy0f9zrIKFdM3q/ZFN85/DQy0Rz5Uu3q6nl8VXRLwcm
        SzwPFZIVjm1zzGVvqEiFs9aoKOX8TWRryxnvGxsESlGjcCxmfOt7sl22v8ENHlDC
        rZeLfZtymYngL3CbrXHy1LJ9cjxi3m1eIbhu7W23oEUGKQUgR/XVJUqwtB6YehDq
        9xHF6FsdVYryR6mpwe7YkwbTm0qcUOt3KcdUa7/pNMcYjsfgjj75j4L2UCo+REDh
        Sb00PFRY3xoPCt5DHLRPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650914314; x=1651000714; bh=QuL7hD9lSS+3B
        Nz+K1mxWsAN4KCiWLNaSadaO01tNb0=; b=asspWAV3MrEwJpyVkNfIib/C/y1Ho
        +QRIJeT3OfdivF+AGfHuRwblpdMCAilTlZmy6XbliX44DOqoMC6dVolk2EAPuYyG
        XL66q/X3PmwJ0cNcq6YRfMM2MthYJAAQ6kl+g2y1j73QCOKg1c5LzIe3dH12MQ7C
        ncFD74Qfpi8zR5OKtz4YNkbvw7AFtV6xAwjM4Ei/0mzcwHdqTxMMYrTTBsRkmNwH
        70umjWSpmiN3O+gthixiqG36OrI97Z5U+fHhujIoW+xr73qDn6DwTzLSC5xkd3NH
        lo8RMKLb/x8KiDWC63+hAZyWHYZXubkMcwNEF0fxBuluycjWvK8lpEXag==
X-ME-Sender: <xms:CvRmYrxx-Vh0nM6hg78ga3gj-hEoGZIcxQTA4lB1IdwtlhNZ--LsJA>
    <xme:CvRmYjRxqif_thcR6HORrWN8uzBg_5bFmhVAPEYxpest0jLoykifSjbZFge_z9lc5
    vwH7jQLUsTUqw>
X-ME-Received: <xmr:CvRmYlVDl3Br_PjoTOAcVS7vvYcPuw9WYA6nmSbt46grCmsBMAnVing3Brm_CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddugddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuhffvvehfjggtgfesth
    ekredttdefjeenucfhrhhomhepffgrnhhivghlucfjrghrughinhhguceoughhrghrughi
    nhhgsehlihhvihhnghdukedtrdhnvghtqeenucggtffrrghtthgvrhhnpeejhfdvfeefve
    etuefhveegleefudeuiedvfeejffdukedvffffteefkeduleekieenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguhhgrrhguihhngheslhhivh
    hinhhgudektddrnhgvth
X-ME-Proxy: <xmx:CvRmYlh1JeTau6l9WfRFtgBGTz8gkMvfnRbO2vRsqr85yDh5FaeHMg>
    <xmx:CvRmYtDKw4TtFj2Vi2RJJyubyrgH1jmdzEYinoHJOHsp3mhdvT8oQw>
    <xmx:CvRmYuLWOkjaC-Sq7i39vLmwJIPn7VF_s6FNa4KiAMDlbSkIUek0cg>
    <xmx:CvRmYo9iQ55cCDRSSPm-30nNGZ-q2doiSpO6J9MMZSxtk1mqLJYT1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Apr 2022 15:18:32 -0400 (EDT)
Message-ID: <e8ea254c-08db-06df-1101-4af1777d174b@living180.net>
Date:   Mon, 25 Apr 2022 22:18:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Resend: Regression in 5467801f1fcbd
Content-Language: en-US
From:   Daniel Harding <dharding@living180.net>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        shreeya.patel@collabora.com
Cc:     linux-gpio@vger.kernel.org, stable@vger.kernel.org,
        andy.shevchenko@gmail.com
References: <34212129-bb2e-46d4-4536-28f11b1c61ca@living180.net>
In-Reply-To: <34212129-bb2e-46d4-4536-28f11b1c61ca@living180.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[Apologies for the original HTML email]

The commit "Restrict usage of GPIO chip irq members before 
initialization" breaks suspend on a Dell Inspiron 5515 laptop in a very 
severe way.  Suspending with this commit present causes the machine to 
lock up hard.  The only way to recover is to disconnect mains power, 
open up the case, disconnect the battery, and hold down the power 
button.  Bisecting pointed to 2c1fa3614795e2b24da1ba95de0b27b8f6ea4537 
in 5.16.20.  Testing with the source commit, 
5467801f1fcbdc46bc7298a84dbf3ca1ff2a7320 confirmed that it was the one 
that introduced the problem. Unfortunately, this commit was backported 
to multiple stable kernels:  5.17.3, 5.16.20, 5.15.34, and 5.10.111.

I have not yet done any debugging to determine exactly why this commit 
causing things to break, but am happy to try out any fixes over the next 
couple of days until I put my laptop back together properly.

Regards,

Daniel Harding
