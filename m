Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745031EF5D6
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 12:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgFEK4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 06:56:07 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:3796 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726529AbgFEK4H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 06:56:07 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 055AtYnU000706;
        Fri, 5 Jun 2020 05:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Z4RbQvrK5Uz13D2MLs4E3UKIzkSv6CypgiRBDLsO4Bw=;
 b=VP377OqvBLS2SbQ1qo09YgCjYUZw1ju4jaLOkX+JZ2MpBjfcDhyhe/0+WXAhoYGVFEr9
 rS591SbbvCNEQu/bgZTSlvQpmZ91IiD9FBI+Sp/rniqzZArg2FcZRpYVhTv8Zln6Br8O
 fzg+ZwOoPGvumsGgcmGflAYjoF6p1vfhnq1gITXP0cdxeZ2sX7qN7igTW1WZUUIdG6Az
 yZDGYpkdDMX/K6gUK5E9J3+oPmox3FX0uGusus7Se9wT7OtDlqoA2kuF/wTOY5x4rA2j
 z0uupWcSupRiD8sBa1olwMnloYUMybbc5Cpmg3Qz6JxRWbI7dfMxJnrZMqpneBu7t5U/ SA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 31f92g137y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 05 Jun 2020 05:55:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 5 Jun 2020
 11:55:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 5 Jun 2020 11:55:56 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E846E2AB;
        Fri,  5 Jun 2020 10:55:55 +0000 (UTC)
Date:   Fri, 5 Jun 2020 10:55:55 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <patches@opensource.cirrus.com>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <emamd001@umn.edu>,
        <wu000273@umn.edu>, <kjlu@umn.edu>, <smccaman@umn.edu>
Subject: Re: [PATCH] gpio: arizona: handle pm_runtime_get_sync failure case
Message-ID: <20200605105555.GM71940@ediswmail.ad.cirrus.com>
References: <20200605025207.65719-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200605025207.65719-1-navid.emamdoost@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 cotscore=-2147483648 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006050084
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 09:52:07PM -0500, Navid Emamdoost wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
