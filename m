Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5331EE472
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2020 14:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFDMbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 08:31:05 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60472 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFDMbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 08:31:04 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054CGWMQ169869;
        Thu, 4 Jun 2020 12:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=p50nfK6c0axXgdD+SiJnP8v0Oz8oiv+sqt/hvkFeNoo=;
 b=fbwz9OjAIC1zG3T7hrypOKrzqF5niOCCEq4QDRimlzjtXE6va0WnNZXOKlYpkV6GaCxN
 CSi614YXQOvjhURSN+MuKR9FNNCnkk51VTpjUDKHaC8fV45QO2dW68MH5oN976eyBiYu
 o4svG+LlSHir/yLNhwRg1tWsFICMjY2XvJZgeV53DjCV4lag301x2+MIbCY4kzrTzLxf
 p0ZSYkcL8lObe3rfgdc75jfFhJhhhA4xYtreVRengsV9Fsa559i4wDnix6xdkH36RujZ
 XWZO/6AJm5Vv1wonW7UAyLRychnX3yyt8fhZkNVdit2nmtGhftY2Uy4RCjkWmnBGOzLx xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 31evap1dpy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 04 Jun 2020 12:30:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 054CE48u123956;
        Thu, 4 Jun 2020 12:30:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 31c25v543f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Jun 2020 12:30:50 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 054CUlxV008967;
        Thu, 4 Jun 2020 12:30:48 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 04 Jun 2020 05:30:47 -0700
Date:   Thu, 4 Jun 2020 15:30:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Joe Perches <joe@perches.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()'
 which is unused and broken
Message-ID: <20200604123038.GG22511@kadam>
References: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
 <20200601183102.GS30374@kadam>
 <CACRpkdasbS-4_ZwC-Ucm8tkSUW5tAQdUrXjxHXQ3J0goVYfgHw@mail.gmail.com>
 <20200604083120.GF22511@kadam>
 <2aa49a543e6f48a6f428a37b63a06f9149870225.camel@perches.com>
 <alpine.DEB.2.21.2006041147360.2577@hadrien>
 <32232229031e02edcc268b1074c9bac44012ee35.camel@perches.com>
 <alpine.DEB.2.21.2006041228520.2577@hadrien>
 <10e54ee84bd44171ef329bed9e7e6a946bae61ba.camel@perches.com>
 <alpine.DEB.2.21.2006041328570.2577@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006041328570.2577@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9641 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006040086
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 04, 2020 at 01:42:12PM +0200, Julia Lawall wrote:
> OK, I recall a discussion with Dan where he suggested that some things
> that were not actually bug fixes could also merit a Fixes tag.  But it's
> probably better if he weighs in directly.

I generally think Fixes should only be used for "real bug" fixes.

The one exception is when I'm reviewing a patch that fixes an "unused
assignment" static checker warning is that I know which commit
introduced the warning.  I don't have strong feelings if it's in the
Fixes tag or if it's just mentioned in the commit message.  But it
helps me when I'm reviewing if I don't have to grovel through git
history myself.  Also I think that it's always a good exercise for
people fixing patches to look at how the bug was introduced.

regards,
dan carpenter
