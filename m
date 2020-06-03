Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79BF51ECDDB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 12:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgFCKxM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 06:53:12 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49378 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFCKxM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 06:53:12 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053AqjCt035816;
        Wed, 3 Jun 2020 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=B4fOgwsHy+LjALGBYT8wqUSIN+UcrBa3FHE50266vaw=;
 b=Ak7WDeEg+oq55cj0x+RWYyRlILZV1obyiLiwEE+Y/b1oZT3A92a7gNIV/mCnX6NMv9vb
 P/DRsVjCyk/hUHVZyayIV8fxwcQlhUzeaQTiTICM8IZ4LPDFuvK97E/88wdDXU41Wjvc
 Lvk9NpGQcL8j0DHej4LpntP/4JEGgTY1rdTJnjn3ymDpLr3pdncN2g48qwAj3dfgHd+L
 vZVuIhkp6TD45Gj/OdOol68YF8FWWn6iafYjjYMdcslhOZqUflvNha/U+A4ExfsYRFU0
 EFOyzzS3FkFZk4Hf15THzMqucNkmQ9EGSfApe8h0PU5ajv12IOrsPxme2zTSDIlVX+KJ yg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31bfem8j91-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 03 Jun 2020 10:52:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 053Am2qn061746;
        Wed, 3 Jun 2020 10:52:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 31dju31th3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Jun 2020 10:52:49 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 053AqhAn011739;
        Wed, 3 Jun 2020 10:52:43 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 03 Jun 2020 03:52:42 -0700
Date:   Wed, 3 Jun 2020 13:52:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com, aalonso@freescale.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid
 a resource leak in case of error in 'imx_pinctrl_probe()'
Message-ID: <20200603105234.GA22511@kadam>
References: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030085
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 02, 2020 at 10:06:26PM +0200, Christophe JAILLET wrote:
> Use 'devm_of_iomap()' instead 'of_iomap()' to avoid a resource leak in
> case of error.
> 
> Update the error handling code accordingly.
> 
> Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks!  You are a hero!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

