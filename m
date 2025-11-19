Return-Path: <linux-gpio+bounces-28838-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB2C70B82
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 19:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECA8F4E7CE8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96B631B11D;
	Wed, 19 Nov 2025 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqadPup9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A66E2F6596;
	Wed, 19 Nov 2025 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763578179; cv=none; b=OA5u4SNgs3zpqNgWU9Fio8g+qx61fafQKp2SKf7kPqljaqYE4iN58Ff/LG5HXG8MIU2A9VSOdj5/Jp/kGHJ8Xgj2KMtQy4okPEQMyIB3zMg5VuoZUobyG1hqsF6IXKu9RItA9yT5Udghe2vqpLPsB8Pw7XUG/3u6WJdrvepu5lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763578179; c=relaxed/simple;
	bh=hfbY7ETr/t4WbNbkBNCJIkNsyOm9ZlqY/Cu5vgIEQ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjklWyU1pkYeuUeVNsfu8Vk1bKFlYwXy4H61yV0Ga90sVxdr77jFGXQv7m47YJe9Z+LZGjDqGBYenbeZBUQfjYZUovSvDL62ZR57PemSE2NgGr4ueD+BZF+Q+TevZVNfNtfKOx1WMGs1EMHY7fr5gyIGTiLjCfk9L8AIMFhG8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqadPup9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763578173; x=1795114173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hfbY7ETr/t4WbNbkBNCJIkNsyOm9ZlqY/Cu5vgIEQ8U=;
  b=GqadPup9xHLDmP70qY3+trHP8b+XHuGY0/HmtE+WvkLUM2bAd0nW7D4H
   3z8wq6JFNNtRflMP+pczWQAmc8QK8E060rca2nn05OUiEiuBripSlF4Ze
   VArBUqt4xr9xCNa1/oVnLHyE16LfKrTOJmQsnlcSDmYZbzKJ08TU9fwk5
   hwLHXoEH6dFZkUbLz5u+zlhYb9++xBLtRsHRnTPHo5c1CVJ7vAS0EsOjD
   HirjME+m/cPZp0lfuv6h5t/9n1LT6e7em6y6ZcKOj/Subs8XzYuInbTtc
   tURjvowz7rI4iALFuxlp83bwWVDrrIrTnyCb/G7wNABojGe4PO0U1297O
   Q==;
X-CSE-ConnectionGUID: 9aiAJHqLRLGZu49PgoBIfg==
X-CSE-MsgGUID: /97sz77rS5i7WcklUfNZaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="91109350"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="91109350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 10:49:28 -0800
X-CSE-ConnectionGUID: pywpJhxXTGmGFF/ZrT1vBw==
X-CSE-MsgGUID: z9Dp3NOsRLqkFAVaURnI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="195256118"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2025 10:49:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLnF5-0003Br-1r;
	Wed, 19 Nov 2025 18:49:23 +0000
Date: Thu, 20 Nov 2025 02:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: 2724853925@qq.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	2724853925@qq.com
Subject: Re: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
Message-ID: <202511200123.RGbEPLxi-lkp@intel.com>
References: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_995E6FC62EDBC1EED14E6052847F270F6406@qq.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/tencent_995E6FC62EDBC1EED14E6052847F270F6406%40qq.com
patch subject: [PATCH] input: touchscreen: Add ilitek touchscreen driver support
config: um-randconfig-r053-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200123.RGbEPLxi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200123.RGbEPLxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200123.RGbEPLxi-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_udp_reply':
>> include/linux/skbuff.h:1336:(.text+0x1643): undefined reference to `__alloc_skb'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_udp_reply':
>> include/net/netlink.h:1001:(.text+0x167f): undefined reference to `__nlmsg_put'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_udp_reply':
>> drivers/input/touchscreen/ilitek/ilitek_main.c:83:(.text+0x16b9): undefined reference to `netlink_unicast'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_udp_reply':
>> include/linux/skbuff.h:1275:(.text+0x1900): undefined reference to `sk_skb_reason_drop'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_netlink_init':
>> drivers/input/touchscreen/ilitek/ilitek_main.c:1833:(.text+0x3458): undefined reference to `netlink_kernel_release'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_netlink_init':
>> include/linux/netlink.h:62:(.text+0x3475): undefined reference to `init_net'
>> /usr/bin/ld: include/linux/netlink.h:62:(.text+0x347a): undefined reference to `__netlink_kernel_create'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_netlink_exit':
   drivers/input/touchscreen/ilitek/ilitek_main.c:1833:(.text+0x4d15): undefined reference to `netlink_kernel_release'
   /usr/bin/ld: drivers/input/touchscreen/ilitek/ilitek_main.o: in function `ilitek_main_remove':
   drivers/input/touchscreen/ilitek/ilitek_main.c:1833:(.text+0x71e3): undefined reference to `netlink_kernel_release'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +83 drivers/input/touchscreen/ilitek/ilitek_main.c

    53	
    54	static void __maybe_unused ilitek_udp_reply(void *payload, int size)
    55	{
    56	#ifdef ILITEK_TUNING_MESSAGE
    57		struct sk_buff *skb;
    58		struct nlmsghdr *nlh;
    59		int len = NLMSG_SPACE(size);
    60		int ret;
    61		int pid = ilitek_pid, seq = ilitek_seq;
    62	
    63		TP_DBG(NULL, "[%s] ilitek_debug_flag: %d\n", __func__, ilitek_debug_flag);
    64		if (!ilitek_debug_flag)
    65			return;
    66	
    67		skb = alloc_skb(len, GFP_ATOMIC);
    68		if (!skb) {
    69			TP_ERR(NULL, "alloc skb error\n");
    70			return;
    71		}
    72	
    73		nlh = nlmsg_put(skb, pid, seq, 0, size, 0);
    74		if (!nlh)
    75			goto nlmsg_failure;
    76	
    77		nlh->nlmsg_flags = 0;
    78		memcpy(NLMSG_DATA(nlh), payload, size);
    79	
    80		NETLINK_CB(skb).portid = 0;	/* from kernel */
    81		NETLINK_CB(skb).dst_group = 0;	/* unicast */
    82	
  > 83		ret = netlink_unicast(ilitek_netlink_sock, skb, pid, MSG_DONTWAIT);
    84		if (ret < 0)
    85			TP_ERR(NULL, "ilitek send failed, ret: %d\n", ret);
    86		return;
    87	
    88	nlmsg_failure:
    89		kfree_skb(skb);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

