Return-Path: <linux-gpio+bounces-36656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMPBAnjkAmpEyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:27:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2D651CAE1
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 10:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75B67300D548
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA22C4921AF;
	Tue, 12 May 2026 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxP6UpVR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA822FD1AA;
	Tue, 12 May 2026 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574445; cv=none; b=J5zJ4Oij8q+ulhS+F9D7/eVyC1KfUtl4Dm6j0lW9q2DZrfCOQS+lvdtdskm6fOVLttFivgfsJfG4AJIN5fGuvzWYiTF28/OdO8P7l69MDEPLWX32q+e/QnhP57ZYmLCGORjg/JgIcoppah3XFhWzQ6Dgz3fjFjgC6QE/v/jVtNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574445; c=relaxed/simple;
	bh=MGxfkB4f1YPzv+2rQ0ibvF//HUAcwxsbrKYfamaw4gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4wItfaRNfSF5CQQjDJJKMv5nXBpmWv5278W1ji00k+xjHZz0FMee19Yv8EZs8CNGGc5rpo8ZJQvSGDgigJuGWqP7xV+pgbchl4DRufTISGOZd97jKUvTujz7VG3xUo+Q2kGE8y4AQAQc4MlsM2dkBKshIC/80wUJ0FSrNHNANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxP6UpVR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778574444; x=1810110444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGxfkB4f1YPzv+2rQ0ibvF//HUAcwxsbrKYfamaw4gw=;
  b=mxP6UpVRGvhUe7dC+OOKTGn5nONjvvjbQXAm9BlNlFIKEu3u0SNM8G/W
   dbM9sWVgTqvY5wGXltcPHbDfnTKiB2m53oS8RBuLyTFk5mMZnh5BZppXn
   g9bZNVr08iYBtVdJO7h1aNna86vJIVdAooYl0qdywfTVEWXTr1uWepHIr
   C0TcuSHm9CBPisgDAz0v/CWbibZxuLGHtHqnVOGROL7JSEKBHr0IveSry
   /Et8TLggmDoRfSTkK33mldZnhZI9hV5ZdHL8PLuDrnrmI/QQeIu9hwRsW
   yqvZaFg2T5BaavA2Pe3n1ue6pESDt7Qvf2q7cLM5LpFAyxPxf2SlQ4DDy
   A==;
X-CSE-ConnectionGUID: cX8URBfgTy6fINTtW9bZ0g==
X-CSE-MsgGUID: GSY7K2HoSoinQCH/rVW7rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="67005853"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="67005853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:27:23 -0700
X-CSE-ConnectionGUID: oL6Qld/uRB+lKqPw/BF18A==
X-CSE-MsgGUID: t8LGiDMoQ1OO5IoNe+vLIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233388576"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:27:15 -0700
Date: Tue, 12 May 2026 11:27:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <djbw@kernel.org>,
	Lizhi Hou <lizhi.hou@amd.com>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v7 5/8] cxl/test: Use fw_devlink_set_device()
Message-ID: <agLkYL3B4woGIDCP@ashevche-desk.local>
References: <20260511155930.34604-1-herve.codina@bootlin.com>
 <20260511155930.34604-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511155930.34604-6-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 0C2D651CAE1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,linuxfoundation.org,google.com,opensource.cirrus.com,cirrus.com,gmail.com,linux.intel.com,stgolabs.net,intel.com,amd.com,lists.linux.dev,vger.kernel.org,microchip.com,bootlin.com,huawei.com];
	TAGGED_FROM(0.00)[bounces-36656-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 05:59:25PM +0200, Herve Codina wrote:
> The code set directly fwnode.dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



