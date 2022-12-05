Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BB664295F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiLEN2E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiLEN2C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:28:02 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E3264F3
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:28:00 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id A5F1F5C00E4;
        Mon,  5 Dec 2022 08:27:59 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 05 Dec 2022 08:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670246879; x=1670333279; bh=KuspcGKCFc
        EQt+MG2SJBWlK48nNiLGqvcCqh6umf4dU=; b=omyBLB7Ejy5Ad1Rexf2Q3uFfSb
        /gPYrrgj14UNdwAT8ghVapYrSJIdKYPM7itDO1Jk7DqHHJOFGbhJ7tacqJhOFZGE
        RvWTHx9NvBh8j96DTrIy6OR+TpO9ZT07poLQlkbkgBpeTjpzs3L0+Kf5nq/0nfrb
        2Gma6LVHGIaN4o/NeMF9uOW/0UbmxZ/laYTRFEfh60UTxU+tVs/BhqFABwFytKpw
        Io2OLYS5UC62csYr+coaRiEPYhUe+jyTWYIXpSZ6F/Qg9UnO1mlnM2I9j3TxAcJ3
        +rftaS/mtXJMfyJ/rap7RP3r9UnVAsdap8Vkaa11qZYn86q0Z9ZB04ItX68Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670246879; x=1670333279; bh=KuspcGKCFcEQt+MG2SJBWlK48nNi
        LGqvcCqh6umf4dU=; b=F7DTq3ykSmswHCut3Ar6lbKx8r9FOF/td5/2XiTjbA0o
        6aTBIW9CaAo509Y9a0IJULLvhkzQRvbOhCIKzF7CELgxzqGc9UWzzH+FHew9gp3b
        A29xMEwagbD4paLCfpmngT2tj1bUneORmp5Mr1CFs7MYo9LUjnmFN0mZXH/o3H44
        Pa67/Sh+eoxLxnnfz+wAf2dDO0hAocs2d42Pgt0zbl8r1t3r54VfU6YH8v+8Ujc/
        2y1Cqzk1LlgNBqMrXabdmHIE9knDiEjNMmeqe2+jArz3wtoTTyo5pmNF7v98PdLI
        3Ryjwwv0TUWijhPWVbKR2GTf/767P7ghVDNUzNyX7A==
X-ME-Sender: <xms:3_GNY8i2La8qvDe-i6R3h80xHlgQ8mC-pC-1EPo_YoG0-CfHaoxtAA>
    <xme:3_GNY1CfBOFcYQLSnEkDzoJQIJZy-DfpMhbpWG4Ncdz_S9BLhlmMQPXWt5DqXyITJ
    ucDcqWWnxgxPsan4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvvedvieeuteehiefftdfhje
    evvdetffevgffhhfeuudffhedvkeefveeiueejleenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3_GNY0ENOitkvP9r88I61BG1loPZRqwVc5CVZz1RV6sprFLeLJGNzw>
    <xmx:3_GNY9R2b2pL9G2aYUSE6ML-cloWCO7rPmwNnRrVHt5WIHKkWDS5sQ>
    <xmx:3_GNY5zU6xVDxRV5NeabyPqNCwDFVgO8gDVOKU5B1U3ASVb-Vz63SA>
    <xmx:3_GNY3YxaRIxamsoni4P17NjomdnOD7VtJFOj_tJYQqZojwO4iC68w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 788BC1700089; Mon,  5 Dec 2022 08:27:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <49112892-07e4-4c1a-8ee6-d112cc9fb65f@app.fastmail.com>
In-Reply-To: <6e539372-b898-4732-b924-15993e52b4d9@app.fastmail.com>
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
 <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
 <6e539372-b898-4732-b924-15993e52b4d9@app.fastmail.com>
Date:   Mon, 05 Dec 2022 23:57:39 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod]: Meson wrap for libgpiod
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Fri, 25 Nov 2022, at 14:12, Andrew Jeffery wrote:
> Hi!
>
> On Fri, 25 Nov 2022, at 06:54, Bartosz Golaszewski wrote:
>> Hey Andrew!
>>
>> The libgpiod project has undergone significant changes recently. A new
>> major release (v2) is getting closer and I'm thinking that it may be
>> the right moment to rethink updating the build system. Would you be
>> willing to take a look at the current master branch and see if you can
>> swap our current autotools in favor of meson while keeping all the
>> current switches in place (translated to meson of course)?
>>
>> I would be willing to accept meson into the master branch as the main
>> and only build system for libgpiod.
>
> Awesome, let me look into it. I'll let you know whether I can get 
> something together quickly.
>

I've put together a WIP series (though perhaps RFC was a better
description?):

https://lore.kernel.org/all/20221205132207.94775-1-andrew@aj.id.au/

Andrew
