Return-Path: <linux-gpio+bounces-37065-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLCEGI4eC2q8DgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37065-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:13:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2BB56E779
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4815D301AFC4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7FE36EAAE;
	Mon, 18 May 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1MZP8oS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82322339875;
	Mon, 18 May 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113327; cv=none; b=p9pNHsN6fX/mHv+VYTEupBY8NxXBXPaWNEgrDDGbCZrARrtT0x1YxlFyxZMm1bBzJLxSkUeT9E4L03YUgfItU7F3q6CzgSbDNUviZC/OXYAN+Ur1Ptru3jhyjCXWPphFgtzRSyma73jYtSw4J2MwWLC2audgNSxfoscWHpBFe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113327; c=relaxed/simple;
	bh=mzdUGjptPGCWYrKlm2AXRbai4/5BaA3YOPkWJ6uQktw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVPTROgNeaUohPQwyr0ifLRBoTZD/ClAX2giQV669Bw9BDSxD9n6Fjt7iYYwCj2JIdkzIyUOIyWyePyIWPI7PzatjJPhFkBrcTTpAIhEJ9i2SZhxxKq/11BQTNAW6IpwJ+jS9CHS31ekzmWunyLwSt5xNB/EahpLhZZHYMqfDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1MZP8oS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779113327; x=1810649327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mzdUGjptPGCWYrKlm2AXRbai4/5BaA3YOPkWJ6uQktw=;
  b=Q1MZP8oS0dwOinpQt424xdNnpuEnjLB3uD0z9KBtSQLzjz9vJ3u8CyzN
   IybCpOdvnfGu/d2z67HUye3ion7dEeA1xY0ma0PkBJ/P2qov4ExWQNY2W
   AhJ/b84k+dWspKDmeO8PQWGftahbnY5D4s/jITg/+CnCg2TMP/LsG5oKy
   +1J/tbmemfOSsLfbwC0oMNM6si2M5sAeoI26IpHjyOFZbq8afCBG6PkWC
   7uW1fd5za+NRp5XpgCMObQ9n5RtKYn+CBL88vFm+QrWvgYSj4ugRA25lR
   eGPdd4wups9DHKG9U8OjfQooY4WklBlOV2eWAIRKNrwmORJRehN1MLlNC
   Q==;
X-CSE-ConnectionGUID: 8C7KvXQ9StulHUWKrIfTAA==
X-CSE-MsgGUID: FLbsd6Q2TDO6ms05nDRQhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79997248"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79997248"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 07:08:46 -0700
X-CSE-ConnectionGUID: uDj6aWkPSP2M7vxBc8bC5Q==
X-CSE-MsgGUID: EG8JKn7zRoirG1gCKic/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239516925"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 07:08:44 -0700
Date: Mon, 18 May 2026 17:08:40 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org,
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
	linus.walleij@linaro.org
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
Message-ID: <agsdaJMAmtefi7tR@ashevche-desk.local>
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518122814.8975-1-hardikprakash.official@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37065-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 0A2BB56E779
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:58:12PM +0530, Hardik Prakash wrote:
> Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
> tree. This series contains only the i2c-designware probe ordering fix,
> based on top of that commit.
> 
> The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
> completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
> interrupt bits cleared when the first I2C transaction is attempted,
> causing lost arbitration errors.
> 
> A higher-level ACPI devlink approach was investigated in response to
> Bartosz Golaszewski's suggestion. The DSDT has no _DEP object linking
> AMDI0010:02 to AMDI0030:00, so fw_devlink has nothing to act on.
> Setting this up at the ACPI layer would require either a firmware
> change to add _DEP, or a DMI quirk in the ACPI scan path — equally
> quirk-based as the current approach.
> 
> v5:
>  - Add blank line before #include <linux/acpi.h> (Bartosz Golaszewski)
>  - Use scoped_guard(device, gpio_dev) (Bartosz Golaszewski)

Too fast, I have a comment in v4, do you have a chance to read it?

-- 
With Best Regards,
Andy Shevchenko



