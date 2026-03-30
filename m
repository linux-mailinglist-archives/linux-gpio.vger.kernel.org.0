Return-Path: <linux-gpio+bounces-34427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF2fNwhQymmb7QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:27:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627E3593A0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4844B3045242
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3C53BADBA;
	Mon, 30 Mar 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aR7ee6/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB633B8BC7;
	Mon, 30 Mar 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865746; cv=none; b=DxAMKf5F2mCpWPRCCuvoZUUinWD06U+ySeSe0Yvi9rBvDTNq0GEtUH8dU4JUbgRI3fWu1QtCqEGWvI4vdvimjrOfSVSGINjt7gYDoBKYBQ214t/wbFV5rEclVqz+qCWogxUUu8dguxsVylYrb+9oVCNruoiOy9wxj+xk5i01kK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865746; c=relaxed/simple;
	bh=sfhn4cSxiKkelwlQLVL11Z9nSo1QQjNVXGIpertChNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR3rnjuA5hPHNZxFqwx19dLDSaP8gzVm6R+e+5Q4qtNSL7PsAT2vqYNp7iAdD9GtziZtWFB0nl+bq/KXIEOyRYONvYCqh692mg+pB4uZgrrIdJy3KXg9/sPfiB2AtkqGJHbh4anHVQ301CjrXJpOAsYHRLcwbGeGdked5c4lzTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aR7ee6/V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774865745; x=1806401745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfhn4cSxiKkelwlQLVL11Z9nSo1QQjNVXGIpertChNk=;
  b=aR7ee6/Ve1q0cwakD8tOcn7pCBt00ASaHtNpgX7rReeSfz5hKwgWJf41
   pjMFJOLqMfNW59JclZwbvzCcIOa+PB+XNYOLLlmzHt8Ecd8DLPtOa17AM
   4vnRsIcNp4u5AH/oPxkTwId8tp42BgbgXlPKlzrTrGazxW1M3YeOC2wQk
   uMZepmfBaxHZsBhaUhfdST5eDUplV7x7bYQFY+7WQTuW7mGgd8313Vq6d
   uYfDtJxkA651815PT+9ergmWZJfyYUP8FcVFiT3QMcFCNyZ8znRQKJt3Z
   KAjxZHSUmoIW7HeNDMo/0tGIFIJ6CBVoN7+V8YWZye3iysTUx7cNjUNOw
   A==;
X-CSE-ConnectionGUID: s+K48RFGRt+/+UjhUsyTmg==
X-CSE-MsgGUID: j595iVcoSZ2iR4YN75lLrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86471333"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86471333"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:15:44 -0700
X-CSE-ConnectionGUID: gyw3Q+zISGiy843vURx7cQ==
X-CSE-MsgGUID: CeghpYmxQQyEdDw7Lc56uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="225190476"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:15:41 -0700
Date: Mon, 30 Mar 2026 13:15:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH v4 4/4] iio: adc: ti-ads7950: complete conversion to
 using managed resources
Message-ID: <acpNSoreNmtH74F_@ashevche-desk.local>
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
 <20260329-ti-ads7950-facelift-v4-4-c568c508c49a@gmail.com>
 <CAMRc=MdP-fvm4WWgFdHabCnVbc=rV943YhwrCHaCH9VCo_ZJJg@mail.gmail.com>
 <671889B9-1D36-4F00-B044-0173A13F7403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671889B9-1D36-4F00-B044-0173A13F7403@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34427-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8627E3593A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:24:52AM -0700, Dmitry Torokhov wrote:
> On March 30, 2026 2:20:33 AM PDT, Bartosz Golaszewski <brgl@kernel.org> wrote:
> >On Mon, 30 Mar 2026 00:47:09 +0200, Dmitry Torokhov
> ><dmitry.torokhov@gmail.com> said:

...

> >> -	mutex_destroy(&st->slock);
> >
> >That's a functional change, there's no corresponding conversion to using
> >devm_mutex_init().
> 
> devm_mutex_init() makes absolutely no sense, as well as having
> mutex_destroy() in remove(). The memory containing the mutex will be released
> right after. 

For somebody who debugs mutexes it might make sense. So, I agree with Bart here,
this needs to be addressed (and this is a used patter in IIO).

-- 
With Best Regards,
Andy Shevchenko



