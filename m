Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5018338638
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 07:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCLGve (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 01:51:34 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39084 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCLGvV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 01:51:21 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6hrsS184675;
        Fri, 12 Mar 2021 06:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=nfVErPtyXQ5MgW1bVeg0rBp4RdOwnVOWKK6fum5uLDo=;
 b=BO3xZZ9+SpmqeTwntua1PKf1Wk8s1NC390fE4REQuNd9oiLmTDaQ9/iiKTMJ3npkrZe3
 etp9c9isSUhzsNbfI0c8pXZ7ZkyOhP4dLmgvyEBl7cW0YJm7Vo/NtDAVdkVgQhZ2Jedz
 CnBkfF2FhXMo/KE7KGBpl7nyFdEdnjvK0t6zZ25znJfXa0wxGQX3wK3mcIft6K7f6ncV
 THbtnw+pBqHlJtF7tG7NXUJ4xfM565GPdOYYN7uQXG8Yg72GNkbay6yPuMdKQGDdjvfQ
 CgGSJVDfw9zaIFw01mnxI474l/z77yB8r5f2Yndq63Z6GFScH3tbrtZxpjaJgLASTnfc rQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 373y8c15fd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:51:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6jBuF133084;
        Fri, 12 Mar 2021 06:51:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 374kgw419a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:51:18 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12C6pHqr003826;
        Fri, 12 Mar 2021 06:51:17 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 11 Mar 2021 22:51:16 -0800
Date:   Fri, 12 Mar 2021 09:51:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     michal.simek@xilinx.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: core: Handling pinmux and pinconf separately
Message-ID: <YEsPXZ40nXAHnm4O@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120045
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Michal Simek,

The patch 0952b7ec1614: "pinctrl: core: Handling pinmux and pinconf
separately" from Mar 10, 2021, leads to the following static checker
warning:

	drivers/pinctrl/core.c:1275 pinctrl_commit_state()
	error: uninitialized symbol 'ret'.

drivers/pinctrl/core.c
  1239  static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
  1240  {
  1241          struct pinctrl_setting *setting, *setting2;
  1242          struct pinctrl_state *old_state = p->state;
  1243          int ret;
  1244  
  1245          if (p->state) {
  1246                  /*
  1247                   * For each pinmux setting in the old state, forget SW's record
  1248                   * of mux owner for that pingroup. Any pingroups which are
  1249                   * still owned by the new state will be re-acquired by the call
  1250                   * to pinmux_enable_setting() in the loop below.
  1251                   */
  1252                  list_for_each_entry(setting, &p->state->settings, node) {
  1253                          if (setting->type != PIN_MAP_TYPE_MUX_GROUP)
  1254                                  continue;
  1255                          pinmux_disable_setting(setting);
  1256                  }
  1257          }
  1258  
  1259          p->state = NULL;
  1260  
  1261          /* Apply all the settings for the new state - pinmux first */
  1262          list_for_each_entry(setting, &state->settings, node) {
  1263                  switch (setting->type) {
  1264                  case PIN_MAP_TYPE_MUX_GROUP:
  1265                          ret = pinmux_enable_setting(setting);
  1266                          break;
  1267                  case PIN_MAP_TYPE_CONFIGS_PIN:
  1268                  case PIN_MAP_TYPE_CONFIGS_GROUP:
  1269                          break;

"ret" not set on these cases.

  1270                  default:
  1271                          ret = -EINVAL;
  1272                          break;
  1273                  }
  1274  
  1275                  if (ret < 0)
  1276                          goto unapply_new_state;
  1277  
  1278                  /* Do not link hogs (circular dependency) */
  1279                  if (p != setting->pctldev->p)

regards,
dan carpenter
