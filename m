Return-Path: <linux-gpio+bounces-34194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPm7AA/+xGny5QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:36:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857C3326B0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 909913050EE5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA08235CB81;
	Thu, 26 Mar 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv5P5Hvr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C60B347534;
	Thu, 26 Mar 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517180; cv=none; b=bDcSPI+Z1l55k3zGQhu8937+15iArrCxTvn4M0EtDDDQf0prmxZ8fUW4Xk1IoqXJnHwiHDKbVhdXkcED6HZb3gO+b1hye0GsxUgqA2seGykyMeObj9xjcQJ9QjLRm+/ueCZei0fXNEj5bdYWNRZ6na0cxZNqAPU3ehbJjZidN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517180; c=relaxed/simple;
	bh=XafrxAte6tbTgT1l7MwqogYylofhNsOE8vVj21EiJ04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rlf/zW29+aWDzV2MJVznzGgCx2s8poyYMg3jImK4J5cPhCNW5kRBfOf+h2id1a0GBuZICRzLoJyX2TCarIYMtc0W4gfUGIQxSDvT0iWZXYbZ20o3iqRsRMW+1SSqcNYVM4iearsCPz/pGrRcJrbclWsAVhIjMARYVzTz8UXcVu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv5P5Hvr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774517177; x=1806053177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XafrxAte6tbTgT1l7MwqogYylofhNsOE8vVj21EiJ04=;
  b=Fv5P5Hvr3wQvkybjeo2MuG5sGEdREe0Z1Zw/6T2phoFuOPCefl7TU5K+
   4hM08edugnGWZnc3RzU1Z+wqDeC+xIbYvoacCfF7qqfkL405FQbjX37QO
   f/BFaZiNCP62gle9oMVGf6zTNPVnfFIK7wec4yg8FPibhGrifq4HTOjyp
   ovYEp2L9osA2ZuDcBF44bT6tM7LPGcx9Y10nhSpvxOQcMiy0+Qqg1nrlx
   nApYpeReHr4ms2slaBs2gCz73gQSC8HU+W+U1TzoM0tslWKLBLXZLfC3I
   Af2A9e6xhfr9v4JA/IHcLpuR2IfiZS6epd0bKb9otEzIU7ZW5QTG6AqjB
   A==;
X-CSE-ConnectionGUID: YzPhCIloSaa0svXFPKTwrw==
X-CSE-MsgGUID: 56Fn8dR7TH22yia7Z5MMag==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75591870"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75591870"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 02:26:16 -0700
X-CSE-ConnectionGUID: nTi7nr8XRjSedR+PizMFUA==
X-CSE-MsgGUID: tX1gQux9TlytFAEAsjhFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="221644480"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2026 02:26:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5gyf-000000008if-31df;
	Thu, 26 Mar 2026 09:26:09 +0000
Date: Thu, 26 Mar 2026 17:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
Message-ID: <202603261701.n5u236ZK-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-34194-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 7857C3326B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/RFT-x86_32-Move-OLPC-XO-1-audio-GPIO-to-software-nodes/20260326-073823
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260325-asoc-olpc-v1-1-ebe6de05c7e2%40kernel.org
patch subject: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
config: sparc-randconfig-001-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261701.n5u236ZK-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261701.n5u236ZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261701.n5u236ZK-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/cs5535audio/cs5535audio.c: In function 'snd_cs5535audio_mixer':
>> sound/pci/cs5535audio/cs5535audio.c:167:26: error: passing argument 2 of 'olpc_quirks' from incompatible pointer type [-Werror=incompatible-pointer-types]
     err = olpc_quirks(card, cs5535au);
                             ^~~~~~~~
   In file included from sound/pci/cs5535audio/cs5535audio.c:24:
   sound/pci/cs5535audio/cs5535audio.h:128:71: note: expected 'struct snd_ac97 *' but argument is of type 'struct cs5535audio *'
    static inline int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
                                                         ~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/olpc_quirks +167 sound/pci/cs5535audio/cs5535audio.c

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

