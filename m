Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E8482F88
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 10:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiACJm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 04:42:56 -0500
Received: from mga18.intel.com ([134.134.136.126]:60692 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231151AbiACJm4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jan 2022 04:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641202976; x=1672738976;
  h=message-id:date:mime-version:from:subject:to:cc:
   content-transfer-encoding;
  bh=G9298fUOnExiLnIgnPsn0f51c3zCoju2aHIIVyRrDQI=;
  b=Qsj4ua7S54lixaPtMfLn5SffBKToekldeTIFI5Ed541WLgUk0IVqjrcg
   5XPJgpZNIDBOjJd8nFSi+aSwqzp6hztRCTeGrbxALAKUSvYPcquUkdYM1
   V397R6vCW0C0UpR5MinRb54o4ynl74/ox3Irsn/Bq4F0ZSY/D2t3pQaYB
   V2GUaKfML3iV9079xIE5jYn7mEVAsMudGb+mOCw23IDHYDaad8sTnasU8
   qdcbUlciQmjC8LOLNAin+x5cvp3Xdn8rUjLHEhn+wEqPEIpPIdOFovnuC
   Qgi6e2FpwGcfijQXLF6r3p0J2KmyzjBCl5aR+R2XLBp68gGoCFF7DvWlz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="228859585"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="228859585"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 01:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="511979277"
Received: from mylly.fi.intel.com (HELO [10.237.72.175]) ([10.237.72.175])
  by orsmga007.jf.intel.com with ESMTP; 03 Jan 2022 01:42:41 -0800
Message-ID: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
Date:   Mon, 3 Jan 2022 11:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: pinctrl-cherryview regression in linux-next on preproduction Braswell
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

We have a Braswell based preproduction HW. I noticed linux-next tag 
next-20211224 doesn't boot on it due to following error:

[   34.674271] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
[   34.682476] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
[   34.690681] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
...

Linux v5.16-rc8 is ok. I found the following commit to be reason for the 
regression:

bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an 
interrupt line as unused")

Jarkko
