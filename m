Return-Path: <linux-gpio+bounces-33345-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOBZFjH1s2nYdgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33345-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 12:29:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E192823C2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 12:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C28EF306FCFA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C86E390C84;
	Fri, 13 Mar 2026 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu5puCN0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142FC390224;
	Fri, 13 Mar 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401371; cv=none; b=SXOE1Ah/9jsqNneykCS4tv+eU2jN+KmCsOjEkywvloVS1aEiRPZO2aCcolzR8V9anOanlrszMaMla2CGwm8fCk8ZeURhS08hxDpk5IBuObVKuwESkxzL5AJYzGWwy3mHSSWAPrEHm2Ogo+dKKNzDT1JMNxpa1V9dzhDSLkj1O2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401371; c=relaxed/simple;
	bh=qZSUqVDbcjSL5J7pa7SW1VXUFoHbZTyErrM2uAHYl1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae3Ry6+XVPahODlyuARt/ltDDEdImI/1ZwWrtxB5bG4/haO9oRBUik6vY+unvi8E09akSrrqR5/s54ChWZTOxec/flby5rPgY3PDrSbis4NageR+udA4Wu0OxRCJ8hTHYrZvLpZLc8LRby8UglTqUJNik3vdznaOAv8MXhYEWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bu5puCN0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773401370; x=1804937370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qZSUqVDbcjSL5J7pa7SW1VXUFoHbZTyErrM2uAHYl1g=;
  b=Bu5puCN0c4T9CTRBHVnGsjc1NZQgQdwQyNM9Pna1bTjju0qZQHg62FQ7
   5V5q96r3rrwAgd4Q07npKxcnnNNAgfN4fHxOhJFuHF5VRJZf8NEaljAon
   oVFowLDb2zCt6uexGOAXsyR+Z6z5J3VNBCthO/+BVfEKPl+7Vv32TOpNt
   Plq8e/9qOX9prpBGqJ6PplqkDZkdeaCugr31P95tAeabllQA/aOY5Cqts
   o/R4ZS7fUKEx08ymksqn7IV9h4qtyu5LmRslWmRrOf/AeYxA/Qvf7KWVo
   s63wum3eBnWU4jizYFFlEKbhasDpkMuWCpJZ+YDfgohNL6TTfSImUklZm
   Q==;
X-CSE-ConnectionGUID: g8fPfMo0RHuPZMfvbMcJJA==
X-CSE-MsgGUID: WdNVTHo7SNWpbgiaf0xgBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74619009"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74619009"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:29:29 -0700
X-CSE-ConnectionGUID: 6kYj/7auRbO+/ZLS6AeoVg==
X-CSE-MsgGUID: HXNoPKsWTDugNzMtXVfVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="225823636"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 04:29:15 -0700
Date: Fri, 13 Mar 2026 13:29:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@google.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
Message-ID: <abP1Cdy1uYpQT1KQ@ashevche-desk.local>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-3-herve.codina@bootlin.com>
 <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
 <2026031242-debug-aviation-19b8@gregkh>
 <CAPDyKFpX3A3r4s72PNjBz5QaZUsq1xaGhn5vXwegue7Tyh_Zew@mail.gmail.com>
 <20260313122027.498ff15f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313122027.498ff15f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,linuxfoundation.org,linux-m68k.org,lunn.ch,kernel.org,gmail.com,nxp.com,pengutronix.de,baylibre.com,sang-engineering.com,axentia.se,arndb.de,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,stgolabs.net,huawei.com,intel.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,microchip.com,bootlin.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33345-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: D6E192823C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:20:27PM +0100, Herve Codina wrote:
> On Fri, 13 Mar 2026 10:43:33 +0100
> Ulf Hansson <ulf.hansson@linaro.org> wrote:

...

> Also agree on my side. I will fully remove this function renaming part from
> this series in its next iteration.

Yeah, make this integration easier.

-- 
With Best Regards,
Andy Shevchenko



