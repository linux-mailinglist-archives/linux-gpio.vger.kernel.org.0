Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE537338642
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 07:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhCLG5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 01:57:00 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:32806 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCLG4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 01:56:48 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6jNJX007730;
        Fri, 12 Mar 2021 06:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6FjNKIInCKv9n54WCI+xjYWQrcvh4+qiys6BNfE0MQM=;
 b=y4dllEcOOdvAKWfYG6CvufDkx3aloItsb6PSVvdxxDZIKKX/RHLCYXGGnsKMVQJJw/kJ
 ivpwpOFrMUp4AB/p3AqhqaYTVPKnVL6jzeHK81LGhU7o7qjIEoa3+V1nD4R1jBeAzhoA
 UleEkqKiU0Ttf8kHAoah5tYO+Qq2RriXH0WXTLNXjZHWI+514Sz5N64kDCiNW8vgkk4n
 pAf+tMk+UPnkNb4KTO109O/5AogXkLWe+DVfh2SPHbHWVEKIUl+QZhvmE41G0Yehywft
 85X5ivN2gBwXVV34ZzoU+74v4Df4KCeUZa6w79Kkxh7H4V/LJiP1yKiuUX3H2H60Gu4p SA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 3742cngyw9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:56:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6jZXU156247;
        Fri, 12 Mar 2021 06:56:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 374kp24x57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:56:45 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12C6uiPh011636;
        Fri, 12 Mar 2021 06:56:44 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 12 Mar 2021 06:56:44 +0000
Date:   Fri, 12 Mar 2021 09:56:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     michal.simek@xilinx.com
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: core: Handling pinmux and pinconf
 separately
Message-ID: <20210312065637.GM21246@kadam>
References: <YEsPXZ40nXAHnm4O@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEsPXZ40nXAHnm4O@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120045
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It also complains about the next loop but that's a false positive
because dealing with lists of data is tricky.

drivers/pinctrl/core.c:1297 pinctrl_commit_state() error: uninitialized symbol 'ret'.

I saw these two warnings initially from zero day bot but didn't forward
it on because I only noticed the issue with second loop and not the
first one.  #LifeLessonOrSomething

regards,
dan carpenter

On Fri, Mar 12, 2021 at 09:51:09AM +0300, Dan Carpenter wrote:
> Hello Michal Simek,
> 
> The patch 0952b7ec1614: "pinctrl: core: Handling pinmux and pinconf
> separately" from Mar 10, 2021, leads to the following static checker
> warning:
> 
> 	drivers/pinctrl/core.c:1275 pinctrl_commit_state()
> 	error: uninitialized symbol 'ret'.
> 
> drivers/pinctrl/core.c
>   1239  static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
>   1240  {
>   1241          struct pinctrl_setting *setting, *setting2;
>   1242          struct pinctrl_state *old_state = p->state;
>   1243          int ret;
>   1244  
>   1245          if (p->state) {
>   1246                  /*
>   1247                   * For each pinmux setting in the old state, forget SW's record
>   1248                   * of mux owner for that pingroup. Any pingroups which are
>   1249                   * still owned by the new state will be re-acquired by the call
>   1250                   * to pinmux_enable_setting() in the loop below.
>   1251                   */
>   1252                  list_for_each_entry(setting, &p->state->settings, node) {
>   1253                          if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
>   1254                                  continue;
>   1255                          pinmux_disable_setting(setting);
>   1256                  }
>   1257          }
>   1258  
>   1259          p->state = NULL;
>   1260  
>   1261          /* Apply all the settings for the new state - pinmux first */
>   1262          list_for_each_entry(setting, &state->settings, node) {
>   1263                  switch (setting->type) {
>   1264                  case PIN_MAP_TYPE_MUX_GROUP:
>   1265                          ret = pinmux_enable_setting(setting);
>   1266                          break;
>   1267                  case PIN_MAP_TYPE_CONFIGS_PIN:
>   1268                  case PIN_MAP_TYPE_CONFIGS_GROUP:
>   1269                          break;
> 
> "ret" not set on these cases.
> 
>   1270                  default:
>   1271                          ret = -EINVAL;
>   1272                          break;
>   1273                  }
>   1274  
>   1275                  if (ret < 0)
>   1276                          goto unapply_new_state;
>   1277  
>   1278                  /* Do not link hogs (circular dependency) */
>   1279                  if (p != setting->pctldev->p)
> 
> regards,
> dan carpenter
