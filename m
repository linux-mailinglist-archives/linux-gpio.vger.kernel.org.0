Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B2B132570
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 12:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgAGL6b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 06:58:31 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:63124 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727982AbgAGL6b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 06:58:31 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007BvGbt026141;
        Tue, 7 Jan 2020 05:58:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=cLhF3qKf38jGY8av3O6TIut/RMEI7A1bYJ0WOXmAxts=;
 b=NxEljdX0syV1zKOU1Z+dfQDWPd81WEAQe2vmdebPIwjYWy0XA9PsR3k5xBCJk8Cm0BxR
 aVzo8oRa2xLeZKsF0mbcHgQPJk6kYI4/hzaFIvGo6QkAqZ4cso54bw7mtvcqyVSkK+nG
 XZDBwvfbMH7nI/dcC7iQ4G9oCNippIAtM66BJzOzFaz5z6L7F6IAokJztCP/O3fdWEdS
 H8v1PYIoCZ2UbBNGkDMdpp76R43itToHfn5/QjR5nPhozEVQBWF6lEGETMMaPDlt2fR/
 2odkDmR+/Goa1cOvMHZtnWjNTpvbBfPLM3WdH3XFRXv8dko/PH/eId8BQlZpU9cUcfEE 7g== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=rf@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
        by mx0b-001ae601.pphosted.com with ESMTP id 2xar0tbe23-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 07 Jan 2020 05:58:24 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 7 Jan
 2020 11:58:22 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Tue, 7 Jan 2020 11:58:22 +0000
Received: from [198.90.251.123] (edi-sw-dsktp006.ad.cirrus.com [198.90.251.123])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 57C6E2B1;
        Tue,  7 Jan 2020 11:58:22 +0000 (UTC)
Subject: Re: [PATCH] pinctrl: lochnagar: select GPIOLIB
To:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191218163701.171914-1-arnd@arndb.de>
 <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
Date:   Tue, 7 Jan 2020 11:58:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=950
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001070098
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/01/2020 10:39, Arnd Bergmann wrote:
> On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
>>> subsystem, or if there are still good reasons for leaving it disabled
>>> on any machine that uses CONFIG_PINCTRL.
>>
>> Hm that is a tricky question, they almost always come in pair but are
>> technically speaking separate subsystems.
> 
> I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> are there any examples of the reverse?
> 
>         Arnd
> 

You could have muxable pins that aren't gpios. For example muxing 
between i2c/spi signals. So a pinctrl driver doesn't imply gpio.
