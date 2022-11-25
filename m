Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179AA6382CD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Nov 2022 04:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiKYDmy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 22:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKYDmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 22:42:53 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220D518B1A
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 19:42:50 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E214B3200A2E;
        Thu, 24 Nov 2022 22:42:46 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 24 Nov 2022 22:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1669347766; x=1669434166; bh=1UKdVUKiVh
        K+ZZH1z+XLIphGeZbcYMPGttDh3bt4+cs=; b=nFKYeomwRQQiUo7ohMMy3OpNEU
        e9Y2cN8w1+VdfdGSYQCqsiByNsCWKOLJJMQeg8f3+iTX/gSflUV6+PO61sypdRPp
        +J6JuItzYOeMYBALTZIwNq/plnzQpez63x7YVy7x2NLzJCYzQuKROwk/KQeRT4mV
        7vIbkXiemM9aDxHCA+qn3+aq9uQEmEyLDkp4G6KN2DJfykLEBmOomkzM7vb/Pg51
        th9RCd3GWvWKVDdF9WbAfs10avWk3MQjqaMB/r8e2rEIUl8B10xOp/HnbCvhtSi1
        AEojKVwNmLtcsXD6ORGaqcmWileEClcr0vyD3qIKN/rNjtvIHsSIwiCI28pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1669347766; x=1669434166; bh=1UKdVUKiVhK+ZZH1z+XLIphGeZbc
        YMPGttDh3bt4+cs=; b=vx5cKxAiykle7LfZFECNwYHgSBG9cBhM6DqZbWwcRenJ
        e+5SGYq1xaHOTRrMxJppGn8paIDdWNdmQHr08qAP/1VJAP7Q1wN++jaui9Vs1nBi
        Szn1u9AvieCHHtKvWnkhfxM4cdUvil9ur8+Ddaxft85Hz0ap0CgtAlVWM0qNok0k
        fUt72+enpEH26I1wYBUFWZAggV+TpeHRq0Jfo+oGHG70dSuh1dyZS8UyRgGtVrYH
        FUT01b8yVovYOGRG+nhQ98G83a5zTOtOtGujlVzbO8xFDuOkltWi74+DYusUjHHq
        czdYZnBAVP/TT7iYAUoFlLL4GJaJXMOLugqTpJxiNA==
X-ME-Sender: <xms:tjmAY2dRB9UNxHIpCQfyLMJqwu0dJY-Gu_PigfOYG6XNJ5AKEgihmA>
    <xme:tjmAYwNPKuw1WzYLcyv4TAd2UVJFV8EKNgCQwcMUw_2_0qNv4gTNdf6Z7hqDYPbdL
    zbWQnozSCCewZFwzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeggdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekvdekjeekgfejudffteetge
    ejkeetteduvedtffdtledutdfhheevfeetkeeiteenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:tjmAY3iuJPmTg0Am8W810OWSPnEsZULXRnSjcEpjs3usNUx6GMVBlg>
    <xmx:tjmAYz-F4TS22XNrPY-SCRP8ggVCIfhqW8kYIzV7KA4Xifc2Jgwnaw>
    <xmx:tjmAYysaFNZeKtiM2tW24V7xGc6gWv6KV9JgwSNmPatfRlV-XvValg>
    <xmx:tjmAY40ivM3iMsiTV3ckwZMldVf5oVeoPQ4X-EblVf1_mdX4H9U83A>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 2EEF41700089; Thu, 24 Nov 2022 22:42:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <6e539372-b898-4732-b924-15993e52b4d9@app.fastmail.com>
In-Reply-To: <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
 <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
Date:   Fri, 25 Nov 2022 14:12:24 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod]: Meson wrap for libgpiod
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi!

On Fri, 25 Nov 2022, at 06:54, Bartosz Golaszewski wrote:
> Hey Andrew!
>
> The libgpiod project has undergone significant changes recently. A new
> major release (v2) is getting closer and I'm thinking that it may be
> the right moment to rethink updating the build system. Would you be
> willing to take a look at the current master branch and see if you can
> swap our current autotools in favor of meson while keeping all the
> current switches in place (translated to meson of course)?
>
> I would be willing to accept meson into the master branch as the main
> and only build system for libgpiod.

Awesome, let me look into it. I'll let you know whether I can get 
something together quickly.

Andrew
