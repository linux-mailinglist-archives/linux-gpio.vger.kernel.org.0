Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB77C0816
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2019 16:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfI0O4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Sep 2019 10:56:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:20156 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfI0O4q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Sep 2019 10:56:46 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 07:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; 
   d="scan'208";a="184003564"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2019 07:56:40 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iDrfj-00068P-LL; Fri, 27 Sep 2019 22:56:39 +0800
Date:   Fri, 27 Sep 2019 22:55:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [gpio:devel-drop-trace 1/1]
 kernel/trace/trace_events_filter.c:2142:9: sparse: sparse: too many errors
Message-ID: <201909272248.BzyeYAx6%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel-drop-trace
head:   40da9a24a778d94e034d160bfacf4931ae5922cd
commit: 40da9a24a778d94e034d160bfacf4931ae5922cd [1/1] tracing: drop handling of NOTRACE symbol
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 40da9a24a778d94e034d160bfacf4931ae5922cd
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   include/linux/sched.h:595:73: sparse: sparse: invalid named zero-width bitfield `value'
   include/linux/sched.h:596:43: sparse: sparse: bad integer constant expression
   include/linux/sched.h:596:67: sparse: sparse: invalid named zero-width bitfield `bucket_id'
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2121:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2122:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2123:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2127:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2128:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2129:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2133:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2134:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2135:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2136:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2140:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2141:9: sparse: sparse: unknown field name in initializer
   kernel/trace/trace_events_filter.c:2142:9: sparse: sparse: unknown field name in initializer
>> kernel/trace/trace_events_filter.c:2142:9: sparse: sparse: too many errors

vim +2142 kernel/trace/trace_events_filter.c

1d0e78e380cd28 Jiri Olsa                2011-08-11  2112  
1d0e78e380cd28 Jiri Olsa                2011-08-11  2113  static struct test_filter_data_t {
1d0e78e380cd28 Jiri Olsa                2011-08-11  2114  	char *filter;
a7237765730a10 Steven Rostedt (Red Hat  2015-05-13  2115) 	struct trace_event_raw_ftrace_test_filter rec;
1d0e78e380cd28 Jiri Olsa                2011-08-11  2116  	int match;
1d0e78e380cd28 Jiri Olsa                2011-08-11  2117  	char *not_visited;
1d0e78e380cd28 Jiri Olsa                2011-08-11  2118  } test_filter_data[] = {
1d0e78e380cd28 Jiri Olsa                2011-08-11  2119  #define FILTER "a == 1 && b == 1 && c == 1 && d == 1 && " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2120  	       "e == 1 && f == 1 && g == 1 && h == 1"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2121  	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 1, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2122  	DATA_REC(NO,  0, 1, 1, 1, 1, 1, 1, 1, "bcdefgh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2123  	DATA_REC(NO,  1, 1, 1, 1, 1, 1, 1, 0, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2124  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2125  #define FILTER "a == 1 || b == 1 || c == 1 || d == 1 || " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2126  	       "e == 1 || f == 1 || g == 1 || h == 1"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2127  	DATA_REC(NO,  0, 0, 0, 0, 0, 0, 0, 0, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2128  	DATA_REC(YES, 0, 0, 0, 0, 0, 0, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2129  	DATA_REC(YES, 1, 0, 0, 0, 0, 0, 0, 0, "bcdefgh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2130  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2131  #define FILTER "(a == 1 || b == 1) && (c == 1 || d == 1) && " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2132  	       "(e == 1 || f == 1) && (g == 1 || h == 1)"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2133  	DATA_REC(NO,  0, 0, 1, 1, 1, 1, 1, 1, "dfh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2134  	DATA_REC(YES, 0, 1, 0, 1, 0, 1, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2135  	DATA_REC(YES, 1, 0, 1, 0, 0, 1, 0, 1, "bd"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2136  	DATA_REC(NO,  1, 0, 1, 0, 0, 1, 0, 0, "bd"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2137  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2138  #define FILTER "(a == 1 && b == 1) || (c == 1 && d == 1) || " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2139  	       "(e == 1 && f == 1) || (g == 1 && h == 1)"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2140  	DATA_REC(YES, 1, 0, 1, 1, 1, 1, 1, 1, "efgh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11 @2141  	DATA_REC(YES, 0, 0, 0, 0, 0, 0, 1, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11 @2142  	DATA_REC(NO,  0, 0, 0, 0, 0, 0, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2143  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2144  #define FILTER "(a == 1 && b == 1) && (c == 1 && d == 1) && " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2145  	       "(e == 1 && f == 1) || (g == 1 && h == 1)"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2146  	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 0, 0, "gh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2147  	DATA_REC(NO,  0, 0, 0, 0, 0, 0, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2148  	DATA_REC(YES, 1, 1, 1, 1, 1, 0, 1, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2149  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2150  #define FILTER "((a == 1 || b == 1) || (c == 1 || d == 1) || " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2151  	       "(e == 1 || f == 1)) && (g == 1 || h == 1)"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2152  	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 0, 1, "bcdef"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2153  	DATA_REC(NO,  0, 0, 0, 0, 0, 0, 0, 0, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2154  	DATA_REC(YES, 1, 1, 1, 1, 1, 0, 1, 1, "h"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2155  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2156  #define FILTER "((((((((a == 1) && (b == 1)) || (c == 1)) && (d == 1)) || " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2157  	       "(e == 1)) && (f == 1)) || (g == 1)) && (h == 1))"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2158  	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 1, 1, "ceg"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2159  	DATA_REC(NO,  0, 1, 0, 1, 0, 1, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2160  	DATA_REC(NO,  1, 0, 1, 0, 1, 0, 1, 0, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2161  #undef FILTER
1d0e78e380cd28 Jiri Olsa                2011-08-11  2162  #define FILTER "((((((((a == 1) || (b == 1)) && (c == 1)) || (d == 1)) && " \
1d0e78e380cd28 Jiri Olsa                2011-08-11  2163  	       "(e == 1)) || (f == 1)) && (g == 1)) || (h == 1))"
1d0e78e380cd28 Jiri Olsa                2011-08-11  2164  	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 1, 1, "bdfh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2165  	DATA_REC(YES, 0, 1, 0, 1, 0, 1, 0, 1, ""),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2166  	DATA_REC(YES, 1, 0, 1, 0, 1, 0, 1, 0, "bdfh"),
1d0e78e380cd28 Jiri Olsa                2011-08-11  2167  };
1d0e78e380cd28 Jiri Olsa                2011-08-11  2168  

:::::: The code at line 2142 was first introduced by commit
:::::: 1d0e78e380cd2802aa603a50e08220dfc681141c tracing/filter: Add startup tests for events filter

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
