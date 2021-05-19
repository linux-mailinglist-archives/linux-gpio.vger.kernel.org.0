Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E31388B93
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 12:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347302AbhESKWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 06:22:15 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:65356 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1346200AbhESKWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 06:22:15 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JAGCk9022302;
        Wed, 19 May 2021 05:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=372dr6SwmwYwOUb7PJzGd6F0k/qxZb2QrHZ6Tt9d8Pw=;
 b=JKEEZqp/2QnfOrdyWkoJuCJkz1dZSQbn39px/nohG2OiEhtxpfqpO/LssvU54LoNwwcu
 Sh8ASGHCfov1Ni6Z/JfyL7YHjtMe9BScgJKkJRp76jbTyUr2i6xOOrs/fxfdFlsJFRA0
 ouhL2ZDAPH71QMsGu9tLTEoEpXqYCX6Pwwr5M3OHTumWEKV2cokSVu3p4jLNlc3cvRe4
 3SrsUXYegMl1pXBKVdCdQuwFpIjOkHxP6I311jBrVIsb7e/4O/31uWFLX0IagxbU3f4a
 l6CHnGOH6VHrqHwuyT/VhctOxz3+KcdygELttWHOhB6PdxcPpEoN/N2GEbcpk5Z21rIH eA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 38kqtwjp1r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 19 May 2021 05:20:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 19 May
 2021 11:20:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 19 May 2021 11:20:36 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 718C911CD;
        Wed, 19 May 2021 10:20:35 +0000 (UTC)
Date:   Wed, 19 May 2021 10:20:35 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Drew Fustini <drew@beagleboard.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Saravana Kannan <saravanak@google.com>,
        <alsa-devel@alsa-project.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 05/10] docs: update pin-control.rst references
Message-ID: <20210519102035.GH64205@ediswmail.ad.cirrus.com>
References: <cover.1621413933.git.mchehab+huawei@kernel.org>
 <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <46ac2e918c7c4a4b701d54870f167b78466ec578.1621413933.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: kjVnaIbt4ji1tbhMzTpF3hssfkrUUfoU
X-Proofpoint-ORIG-GUID: kjVnaIbt4ji1tbhMzTpF3hssfkrUUfoU
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190071
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 10:51:42AM +0200, Mauro Carvalho Chehab wrote:
> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

For the Madera change:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
