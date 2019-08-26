Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90ACD9CCEA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 11:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbfHZJ6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 05:58:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:49016 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730338AbfHZJ6P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Aug 2019 05:58:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 02:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="197019323"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2019 02:58:12 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Uwe =?utf-8?Q?Kleine-K?= =?utf-8?Q?=C3=B6nig?= 
        <uwe@kleine-koenig.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
In-Reply-To: <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190824233724.1775-1-uwe@kleine-koenig.org> <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
Date:   Mon, 26 Aug 2019 12:58:11 +0300
Message-ID: <87o90c9rkc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 24 Aug 2019, Andrew Morton <akpm@linux-foundation.org> wrote:
>> --- a/lib/vsprintf.c
>> +++ b/lib/vsprintf.c
>> @@ -533,6 +533,192 @@ char *number(char *buf, char *end, unsigned long long num,
>>  	return buf;
>>  }
>>  
>> +#define ERRORCODE(x) { .str = #x, .err = x }
>> +
>> +static const struct {
>> +	const char *str;
>> +	int err;
>> +} errorcodes[] = {
>
> It's a bit of a hack, but an array of char*'s and a separate array of
> ushorts would save a bit of space.

Or just

#define ERRORCODE(x) [x] = #x

static const char * const errorcodes[] = {
	ERRORCODE(EPERM),
        ERRORCODE(ENOENT),
        ...
};

Saves space, faster lookup, discovers at build time why EWOULDBLOCK
would always show up as EAGAIN in the logs. We don't have holes to speak
of in the error codes.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
