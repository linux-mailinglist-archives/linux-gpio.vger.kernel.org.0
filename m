Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807F31B7785
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 15:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgDXNvZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 09:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726301AbgDXNvY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 09:51:24 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E3FC09B045
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2020 06:51:24 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id s10so9289754iln.11
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2020 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H+CTATUY43QUl8bEZDT4/FwObgvLqI92c3iLY3Q0w14=;
        b=OorVP0iSjGLd1uPapODQNsplj1Gqmm+THths8W6ixLi97RC1HqPzC+yrHHWSUiy5gI
         xxywWUtpL8xY0askqqQCyYo/9yYh3difefwizlJXSrLaXSoi2MlFjXeFtim4v1MBZmhb
         cL9WD+5t/4pm+RWs/73JhkQkGVcOnXySGMiDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H+CTATUY43QUl8bEZDT4/FwObgvLqI92c3iLY3Q0w14=;
        b=VJRqtv/gA+lRE8p8kByzxXq//H4hoIKaXpQT4tbLlN39kuOWjBuOhOiEtXsJ/m9XiD
         +XfJY7OTsoSEEJWCuXvExFIxRR9Cy3F73ORQTgi7xHCf5V44v2EHpcB2GDFVMo4EZ2MR
         tS1bh2J8t/twyJUGaejfjkExvFqcd1Yz8gN7nkV4DVXPjtJjU4XNileUkW+DV7PC4XVy
         477+LZ3qSIQppfYhWDtZ51PsRyoNTE0cWrzlkyo4Uf2RYT1dDHLldlNlo+RC6me2J7lP
         cLiAwVNaewdgEAA5nU4TxC1DZYIO8c5SGnbcCpkEfX2/mItiym8ihk136PyEikKcV7u2
         iDww==
X-Gm-Message-State: AGi0PuadIp9HPZDHL3k3l3PQoIc0v4KqtEsjWcXIOZjmlj+99XdYJbkg
        FqrWOS3pwSdjR04NAqdVlo2ukA==
X-Google-Smtp-Source: APiQypLTkc2GkWL/T3rx0fb+9zJAX28z3GYjexeUDoq25xwzohe8uX2ewDoXKCyKUWlZ8oR3mAf0aw==
X-Received: by 2002:a92:d744:: with SMTP id e4mr8832181ilq.174.1587736284020;
        Fri, 24 Apr 2020 06:51:24 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id h82sm2101809ila.14.2020.04.24.06.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 06:51:23 -0700 (PDT)
Subject: Re: [PATCH] selftests: add build/cross-build dependency check script
To:     Randy Dunlap <rdunlap@infradead.org>, shuah@kernel.org,
        bamv2005@gmail.com, khilman@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200414212208.21667-1-skhan@linuxfoundation.org>
 <374866ac-4519-f367-bdc6-ec8d0c1b6347@infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <734b0bac-ace3-13fc-b8d1-e317a8512c08@linuxfoundation.org>
Date:   Fri, 24 Apr 2020 07:51:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <374866ac-4519-f367-bdc6-ec8d0c1b6347@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/23/20 9:25 PM, Randy Dunlap wrote:
> Hi,
> 
> On 4/14/20 2:22 PM, Shuah Khan wrote:
>> -CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ $(MOUNT_CFLAGS)
>> -LDLIBS += $(MOUNT_LDLIBS)
>> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ $(VAR_CFLAGS)
>> +LDLIBS += $(VAR_LDLIBS)
> 
> 
> (1) Can that series of ../../../.. be replaced by $(objtree)?
> If so, that would be much cleaner IMO.
> 

Agreed. It can be done in a separate patch. We have other tests that
do similar hard coded header paths.

> (2) I can't find anything that checks that ../../../../usr/include exists
> (or has been installed via 'make headers_install').  Or anything that
> requires that CONFIG_HEADERS_INSTALL be set/enabled.  Well, other than
> a Makefile error, but that's not a nice way to find out.
> 

At the moment no. When this Makefile is fixed, that is another check
to add. It is addressed by headers install during selftest make.

Headers are installed as part of selftests make since selftests are
often dependent on recent headers and headers install is a necessary
step.

You are right. There are several tests that need cleanup for such
hard coded values and this dependency check script in this patch
currently does libs check. My plan is to extend this to check for
headers installed or not and flag headers as missing dependency.

I can do that in my next version of this dependency check script.

thanks,
-- Shuah


