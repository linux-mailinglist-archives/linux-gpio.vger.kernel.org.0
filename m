Return-Path: <linux-gpio+bounces-13310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1C9DA3EE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 09:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0B6164958
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 08:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0CF188014;
	Wed, 27 Nov 2024 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQS5Pwyc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822A1114;
	Wed, 27 Nov 2024 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696214; cv=none; b=iOqePIN1tMMcaUNLZfWapfiBFSL2y7dyplZ0xuvpoMfbP3xlKrZkBDUfX1RgSkU51xJfhO5bqBRWB17ZEy499AGQik+947eCtDJ4E1gm9vyLP/nSjFG51o9pzhhWjv0NehzYTXMXUS/Kmi3XFkp3ApwpnSaR3wYP3/STW2SNjdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696214; c=relaxed/simple;
	bh=/oRV7hIUPzEpk+6vrKInkgL1/QdYFRkFO4vKGXZNuDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMsYM9D4JnXlFB06XWfnK/DztCZSP/jusHfLi5qu5B/Kcs+qqrlm+RWNtf8K4nCoiKMtwrQKqIOc1K/MLn7nvGrvsyAWLowh9E9222MJk2Mr6QUWlp+L7u6hpkHDXxe6wOEvkHdbbcWnhj0e3Q5EUFWvHvR25YTU9e/epU06lGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQS5Pwyc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732696213; x=1764232213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/oRV7hIUPzEpk+6vrKInkgL1/QdYFRkFO4vKGXZNuDg=;
  b=lQS5Pwycl2nE+ywNdqh4y4NJjiUxozW6JLVFrYqxXIrTFFEJwn+9zL73
   0Q3xUP/eWm8DnnvmMkhX3q1dutOXKwBpZ4pt9LYIl9swm2z1isr7dZ3Vw
   ItyR8ZD7odbSjmasqu3hS5kNrnMZxitPxk8xlwiLoiPxAbCzMXJZewlaU
   KgMEtBkYVWgJyM2Au7jUobcwMuHYsfU8SnHFtS4Ro8DBC6Wue6osBocF3
   vX41B459L1tSzyj2EZ1dcRFNIi9Ml+TR+zyg5NuaLOdZ+K8CSAbq88KnN
   FqFZWsnxFkRvbWHtKejRNMTWxsNml6O04uzfn8LHPDOulVyifIUmr47mt
   w==;
X-CSE-ConnectionGUID: Oici1sDXRc2kOeh3jdqW/Q==
X-CSE-MsgGUID: IYR4bBbxQG+ZqGquerYeNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32834852"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="32834852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 00:30:12 -0800
X-CSE-ConnectionGUID: fIyf8uVCRXySnZ/c8CIQVA==
X-CSE-MsgGUID: joLlenH8RDOHVykxZcZV9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91822814"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 00:30:09 -0800
Message-ID: <e659ccc0-ab47-4596-b23a-80eff2128c19@linux.intel.com>
Date: Wed, 27 Nov 2024 09:30:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: Intel: avs: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
 andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
 broonie@kernel.org, pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
 <20241126172240.6044-7-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20241126172240.6044-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+Cezary

On 11/26/2024 6:22 PM, Raag Jadav wrote:
> Convert to use devm_kmemdup_array() which is more robust.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>


