Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 871F1FFE2D
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 07:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfKRGBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 01:01:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35700 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfKRGBh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 01:01:37 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAI5xW4j173462;
        Mon, 18 Nov 2019 06:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=lJNfpXyGElRb/i/ta3IUdcy9bQdPNL5BTVX/Bu3Iddw=;
 b=Rp/s+NiZI4tG44vuNrd74O4I0c3NnHRvOgJljmJ3J0h/KRaoiF5qq/MwenYgNsyfQ6Th
 AnxHRZ7M5ZzAS9a47C5IgZo/zcMxDMjt5gPsJDKWkbZkm0y6ADCU/4OwsVZIK2RRyJGN
 6DVH0f4wpDmwuQjxmnnXl+Lf+yZgqTkBrOPS/nrqWIwOgmbQMEJcn1CUhXGKVUxvgrCi
 tqRyFBakr778N7egrQ7vbeuT0/KAjU+1PeviVYaS/dTHjG/SMsiVsttzPWID5CESl4/Z
 d4LP0a56kimUBNR7lDwWdJ8Ca9SoPrnuBbaOkIcH2a2K1DBDH7wmLzpLRj2XDDPKMrpy pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2wa8htdxn4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Nov 2019 06:00:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAI5xUJ0157272;
        Mon, 18 Nov 2019 06:00:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2wau93yfw3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Nov 2019 06:00:38 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAI60N72032599;
        Mon, 18 Nov 2019 06:00:23 GMT
Received: from kadam (/41.210.154.44)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 17 Nov 2019 22:00:09 -0800
Date:   Mon, 18 Nov 2019 08:59:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     kbuild-all@lists.01.org, matti.vaittinen@fi.rohmeurope.com,
        mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 15/16] leds: Add common LED binding parsing support to
 LED class/core
Message-ID: <20191118055941.GB1776@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <773ed63e512f9086483089d67c492d092444bc8a.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9444 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911180052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9444 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911180052
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

[auto build test WARNING on 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c]

url:    https://github.com/0day-ci/linux/commits/Matti-Vaittinen/Support-ROHM-BD71828-PMIC/20191117-030515
base:    31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/led-core.c:400 fw_is_match() error: uninitialized symbol 'ret'.
drivers/leds/led-core.c:465 led_find_fwnode() error: double free of 'val'

# https://github.com/0day-ci/linux/commit/7b8033cfca34525c9e45fe2e74783fef74f4a49c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 7b8033cfca34525c9e45fe2e74783fef74f4a49c
vim +/ret +400 drivers/leds/led-core.c

7b8033cfca3452 Matti Vaittinen  2019-11-16  368  static int fw_is_match(struct fwnode_handle *fw,
7b8033cfca3452 Matti Vaittinen  2019-11-16  369  		       struct led_fw_match_property *mp, void *val)
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  370  {
7b8033cfca3452 Matti Vaittinen  2019-11-16  371  	void *cmp = mp->raw_val;
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  372  	int ret;
bb4e9af0348dfe Jacek Anaszewski 2019-06-09  373  
7b8033cfca3452 Matti Vaittinen  2019-11-16  374  	if (mp->raw_val) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  375  		ret = fwnode_property_read_u8_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  376  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  377  	} else if (mp->intval) {
                                                                   ^^^^^^^^^^
Smatch is complaining about if this is false then ret isn't set.

7b8033cfca3452 Matti Vaittinen  2019-11-16  378  		cmp = mp->intval;
7b8033cfca3452 Matti Vaittinen  2019-11-16  379  		switch (mp->size) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  380  		case 1:
7b8033cfca3452 Matti Vaittinen  2019-11-16  381  			ret = fwnode_property_read_u8_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  382  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  383  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  384  		case 2:
7b8033cfca3452 Matti Vaittinen  2019-11-16  385  			ret = fwnode_property_read_u16_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  386  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  387  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  388  		case 4:
7b8033cfca3452 Matti Vaittinen  2019-11-16  389  			ret = fwnode_property_read_u32_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  390  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  391  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  392  		case 8:
7b8033cfca3452 Matti Vaittinen  2019-11-16  393  			ret = fwnode_property_read_u64_array(fw, mp->name, val,
7b8033cfca3452 Matti Vaittinen  2019-11-16  394  						    mp->size);
7b8033cfca3452 Matti Vaittinen  2019-11-16  395  			break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  396  		default:
7b8033cfca3452 Matti Vaittinen  2019-11-16  397  			return -EINVAL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  398  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  399  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16 @400  	if (!ret && cmp) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  401  		if (!memcmp(val, cmp, mp->size)) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  402  			kfree(val);
                                                                        ^^^^^^^^^^
This kfree leads to a double free below.  Freeing it here is a
layering violation, so delete this one and keep the kfree in the caller.

7b8033cfca3452 Matti Vaittinen  2019-11-16  403  			return 1;
7b8033cfca3452 Matti Vaittinen  2019-11-16  404  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  405  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16  406  	return 0;
7b8033cfca3452 Matti Vaittinen  2019-11-16  407  }
7b8033cfca3452 Matti Vaittinen  2019-11-16  408  /**
7b8033cfca3452 Matti Vaittinen  2019-11-16  409   * led_find_fwnode - find fwnode for led
7b8033cfca3452 Matti Vaittinen  2019-11-16  410   * @parent	LED controller device
7b8033cfca3452 Matti Vaittinen  2019-11-16  411   * @init_data	led init data with match information
7b8033cfca3452 Matti Vaittinen  2019-11-16  412   *
7b8033cfca3452 Matti Vaittinen  2019-11-16  413   * Scans the firmware nodes and returns node matching the given init_data.
7b8033cfca3452 Matti Vaittinen  2019-11-16  414   * NOTE: Function increases refcount for found node. Caller must decrease
7b8033cfca3452 Matti Vaittinen  2019-11-16  415   * refcount using fwnode_handle_put when finished with node.
7b8033cfca3452 Matti Vaittinen  2019-11-16  416   */
7b8033cfca3452 Matti Vaittinen  2019-11-16  417  struct fwnode_handle *led_find_fwnode(struct device *parent,
7b8033cfca3452 Matti Vaittinen  2019-11-16  418  				      struct led_init_data *init_data)
7b8033cfca3452 Matti Vaittinen  2019-11-16  419  {
7b8033cfca3452 Matti Vaittinen  2019-11-16  420  	struct fwnode_handle *fw;
7b8033cfca3452 Matti Vaittinen  2019-11-16  421  
7b8033cfca3452 Matti Vaittinen  2019-11-16  422  	/*
7b8033cfca3452 Matti Vaittinen  2019-11-16  423  	 * This should never be called W/O init data. We could always return
7b8033cfca3452 Matti Vaittinen  2019-11-16  424  	 * dev_fwnode() - but then we should pump-up the refcount
7b8033cfca3452 Matti Vaittinen  2019-11-16  425  	 */
7b8033cfca3452 Matti Vaittinen  2019-11-16  426  	if (!init_data)
7b8033cfca3452 Matti Vaittinen  2019-11-16  427  		return NULL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  428  
7b8033cfca3452 Matti Vaittinen  2019-11-16  429  	if (!init_data->fwnode)
7b8033cfca3452 Matti Vaittinen  2019-11-16  430  		fw = dev_fwnode(parent);
7b8033cfca3452 Matti Vaittinen  2019-11-16  431  	else
7b8033cfca3452 Matti Vaittinen  2019-11-16  432  		fw = init_data->fwnode;
7b8033cfca3452 Matti Vaittinen  2019-11-16  433  
7b8033cfca3452 Matti Vaittinen  2019-11-16  434  	if (!fw)
7b8033cfca3452 Matti Vaittinen  2019-11-16  435  		return NULL;
7b8033cfca3452 Matti Vaittinen  2019-11-16  436  
7b8033cfca3452 Matti Vaittinen  2019-11-16  437  	/*
7b8033cfca3452 Matti Vaittinen  2019-11-16  438  	 * Simple things are pretty. I think simplest is to use DT node-name
7b8033cfca3452 Matti Vaittinen  2019-11-16  439  	 * for matching the node with LED - same way regulators use the node
7b8033cfca3452 Matti Vaittinen  2019-11-16  440  	 * name to match with desc.
7b8033cfca3452 Matti Vaittinen  2019-11-16  441  	 *
7b8033cfca3452 Matti Vaittinen  2019-11-16  442  	 * This may not work with existing LED DT entries if the node name has
7b8033cfca3452 Matti Vaittinen  2019-11-16  443  	 * been freely selectible. In order to this to work the binding doc
7b8033cfca3452 Matti Vaittinen  2019-11-16  444  	 * for LED driver should define usable node names.
7b8033cfca3452 Matti Vaittinen  2019-11-16  445  	 *
7b8033cfca3452 Matti Vaittinen  2019-11-16  446  	 * If this is not working we can define specific match property which
7b8033cfca3452 Matti Vaittinen  2019-11-16  447  	 * value we scan and use for matching for LEDs connected to the
7b8033cfca3452 Matti Vaittinen  2019-11-16  448  	 * controller.
7b8033cfca3452 Matti Vaittinen  2019-11-16  449  	 */
7b8033cfca3452 Matti Vaittinen  2019-11-16  450  	if (init_data->match_property.name && init_data->match_property.size) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  451  		u8 *val;
7b8033cfca3452 Matti Vaittinen  2019-11-16  452  		int ret;
7b8033cfca3452 Matti Vaittinen  2019-11-16  453  		struct fwnode_handle *child;
7b8033cfca3452 Matti Vaittinen  2019-11-16  454  		struct led_fw_match_property *mp;
7b8033cfca3452 Matti Vaittinen  2019-11-16  455  
7b8033cfca3452 Matti Vaittinen  2019-11-16  456  		mp = &init_data->match_property;
7b8033cfca3452 Matti Vaittinen  2019-11-16  457  
7b8033cfca3452 Matti Vaittinen  2019-11-16  458  		val = kzalloc(mp->size, GFP_KERNEL);
7b8033cfca3452 Matti Vaittinen  2019-11-16  459  		if (!val)
7b8033cfca3452 Matti Vaittinen  2019-11-16  460  			return ERR_PTR(-ENOMEM);
7b8033cfca3452 Matti Vaittinen  2019-11-16  461  
7b8033cfca3452 Matti Vaittinen  2019-11-16  462  		fwnode_for_each_child_node(fw, child) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  463  			ret = fw_is_match(child, mp, val);
                                                                                                     ^^^

7b8033cfca3452 Matti Vaittinen  2019-11-16  464  			if (ret > 0) {
7b8033cfca3452 Matti Vaittinen  2019-11-16 @465  				kfree(val);
                                                                                      ^^^

Oops.

7b8033cfca3452 Matti Vaittinen  2019-11-16  466  				return child;
7b8033cfca3452 Matti Vaittinen  2019-11-16  467  			}
7b8033cfca3452 Matti Vaittinen  2019-11-16  468  			if (ret < 0) {
7b8033cfca3452 Matti Vaittinen  2019-11-16  469  				dev_err(parent,
7b8033cfca3452 Matti Vaittinen  2019-11-16  470  					"invalid fw match. Use raw_val?\n");
7b8033cfca3452 Matti Vaittinen  2019-11-16  471  				fwnode_handle_put(child);
7b8033cfca3452 Matti Vaittinen  2019-11-16  472  				break;
7b8033cfca3452 Matti Vaittinen  2019-11-16  473  			}
7b8033cfca3452 Matti Vaittinen  2019-11-16  474  		}
7b8033cfca3452 Matti Vaittinen  2019-11-16  475  		kfree(val);
7b8033cfca3452 Matti Vaittinen  2019-11-16  476  	}
7b8033cfca3452 Matti Vaittinen  2019-11-16  477  	if (init_data->of_match)
7b8033cfca3452 Matti Vaittinen  2019-11-16  478  		fw = fwnode_get_named_child_node(fw, init_data->of_match);
7b8033cfca3452 Matti Vaittinen  2019-11-16  479  	else
7b8033cfca3452 Matti Vaittinen  2019-11-16  480  		fw = fwnode_handle_get(fw);
7b8033cfca3452 Matti Vaittinen  2019-11-16  481  
7b8033cfca3452 Matti Vaittinen  2019-11-16  482  	return fw;
7b8033cfca3452 Matti Vaittinen  2019-11-16  483  }

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
