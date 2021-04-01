Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1219B351889
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 19:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhDARqA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 13:46:00 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:20746 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234950AbhDARlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 13:41:39 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131CQciw030126;
        Thu, 1 Apr 2021 07:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ykBmYInzEvGFT1JMPiXc1lkaeT/jxWDhFNP9Q/A6/08=;
 b=JBN2pNqg6a9pM8wgveEEAANKekva129o80Za/JlxEa8yD9XTaahdQCrZWxWqWjBwfcYA
 0XYzN9+i9q1Ss9rGlQnUB195BidXC4ru+YqBxESdQ4N7OZLyoJecSdcAkjJpuyEvnTvt
 FNJaZW69K+/zJ8SgI/MnMCZ50GOWsh0fhKFwGI5udmLIsQlczCRU/3VhYx97IEAzXf1k
 LYUXLt17d7ZQyRHP+iKYdWEtgulGMPeNxam5CdJ2GKWfv803Y1Sz7l19l4npFT2ajTIH
 1saSDKNKacvdUPxwIl2wJKSfGee1JrZJWiO+bDuNW66PDn2kQr8QOI45ayj7ASVEpdWS JA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 37n2948wfu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 01 Apr 2021 07:40:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 1 Apr 2021
 13:40:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 1 Apr 2021 13:40:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7C81E11D6;
        Thu,  1 Apr 2021 12:40:13 +0000 (UTC)
Date:   Thu, 1 Apr 2021 12:40:13 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 32/32] pinctrl: update pin-control.rst references
Message-ID: <20210401124013.GT106851@ediswmail.ad.cirrus.com>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Io7iL6F3WDP7ZvGws1tN_zCpZy0zXWMf
X-Proofpoint-ORIG-GUID: Io7iL6F3WDP7ZvGws1tN_zCpZy0zXWMf
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=979 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010088
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 01, 2021 at 02:17:52PM +0200, Mauro Carvalho Chehab wrote:
> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
