Return-Path: <linux-gpio+bounces-34196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K1MCDAKxWnn5gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:28:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0E3333515
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 11:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 690763241577
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D08313E03;
	Thu, 26 Mar 2026 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYuJCsiP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4332134D91C;
	Thu, 26 Mar 2026 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519762; cv=none; b=nlSFA2yTQ5TZYEwhPAg75JRnTkEht9HDKgLXu8+U7nUZbAWzZ6D4ozgXeW25UQXO2p8UZ4mI30HgZuomA980PdrkmBZNgSX1pgKqsqWuV56V6JxniVW8dMksmVa10Dr3qBBHKhUg24bvFjx2/ARCnuc7h5wzCeveKzGEFxUmeaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519762; c=relaxed/simple;
	bh=s+D4558G3oU8R0YvDMEI/gfGDw/0rkU3Qj/wYtVwG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOsrag7ujoLzYKS0rDn6CWYW63HcJ4CcA3PUtiooBagKIqr4xgN0OesUIccxacJGg4YFx661i80NHAIy+jQqDBTmFkTTNevgFyk8nRBHW8jLlmBEF7M0S1rb05q0qtXzRqMge2GVxlM6Qb9mIkGtVG3m8quGEd6WB3q+C0PYDoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYuJCsiP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774519761; x=1806055761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s+D4558G3oU8R0YvDMEI/gfGDw/0rkU3Qj/wYtVwG2o=;
  b=lYuJCsiPry+Pjj4EJClsmXfxcR8FHHM/g7p42LLX+7Pq94FJ+6ajEpad
   7hE+HmNpAELzane0MuXG2VZerhKd5RrWyzTWDsTMfZM6bEtGt5qe/nphS
   aLNyxIp7aFRgwR3rceC9MRv5UbsFR6JVLqhWHY632JMwNqTL8ytFOMovS
   SuBEn5nLVNidaXySm8aSEMpcF5+KlDhHKqYdvV87v8pqI/FgnL5oOBECJ
   xl43I2dfAzCzpOT2eveX5Uq5pGbQkspcAJclVgI7feQLrUEwtqrsJ5Aaz
   ZHr5jrT9+dLpfIk32isqB7XynNI8XD1Kc1UJwGOz7nNZ35wuyAzj47S58
   w==;
X-CSE-ConnectionGUID: Fazig4wmQISX5HaCVl09vg==
X-CSE-MsgGUID: ADoksTXtT/GIJ8b1U8HY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63124611"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="63124611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:09:20 -0700
X-CSE-ConnectionGUID: fKBdK13SSMe1TNDTxNivJw==
X-CSE-MsgGUID: Tqpkcb8CStiia4SibxGC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="262875048"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Mar 2026 03:09:17 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5heM-000000008kX-0sHk;
	Thu, 26 Mar 2026 10:09:14 +0000
Date: Thu, 26 Mar 2026 18:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
Message-ID: <202603261710.M57Gdhep-lkp@intel.com>
References: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34196-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 7E0E3333515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/RFT-x86_32-Move-OLPC-XO-1-audio-GPIO-to-software-nodes/20260326-073823
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260325-asoc-olpc-v1-1-ebe6de05c7e2%40kernel.org
patch subject: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261710.M57Gdhep-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261710.M57Gdhep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261710.M57Gdhep-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/cs5535audio/cs5535audio.c:167:26: error: incompatible pointer types passing 'struct cs5535audio *' to parameter of type 'struct snd_ac97 *' [-Wincompatible-pointer-types]
     167 |         err = olpc_quirks(card, cs5535au);
         |                                 ^~~~~~~~
   sound/pci/cs5535audio/cs5535audio.h:128:71: note: passing argument to parameter 'ac97' here
     128 | static inline int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
         |                                                                       ^
   1 error generated.


vim +167 sound/pci/cs5535audio/cs5535audio.c

   134	
   135	static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
   136	{
   137		struct snd_card *card = cs5535au->card;
   138		struct snd_ac97_bus *pbus;
   139		struct snd_ac97_template ac97;
   140		int err;
   141		static const struct snd_ac97_bus_ops ops = {
   142			.write = snd_cs5535audio_ac97_codec_write,
   143			.read = snd_cs5535audio_ac97_codec_read,
   144		};
   145	
   146		err = snd_ac97_bus(card, 0, &ops, NULL, &pbus);
   147		if (err < 0)
   148			return err;
   149	
   150		memset(&ac97, 0, sizeof(ac97));
   151		ac97.scaps = AC97_SCAP_AUDIO | AC97_SCAP_SKIP_MODEM
   152				| AC97_SCAP_POWER_SAVE;
   153		ac97.private_data = cs5535au;
   154		ac97.pci = cs5535au->pci;
   155	
   156		/* set any OLPC-specific scaps */
   157		olpc_prequirks(card, &ac97);
   158	
   159		err = snd_ac97_mixer(pbus, &ac97, &cs5535au->ac97);
   160		if (err < 0) {
   161			dev_err(card->dev, "mixer failed\n");
   162			return err;
   163		}
   164	
   165		snd_ac97_tune_hardware(cs5535au->ac97, ac97_quirks, ac97_quirk);
   166	
 > 167		err = olpc_quirks(card, cs5535au);
   168		if (err < 0) {
   169			dev_err(card->dev, "olpc quirks failed\n");
   170			return err;
   171		}
   172	
   173		return 0;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

