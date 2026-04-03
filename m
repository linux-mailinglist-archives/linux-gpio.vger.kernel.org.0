Return-Path: <linux-gpio+bounces-34638-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDNTFGC0z2l1zgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34638-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 14:36:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AD394148
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 14:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD36030F9418
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 12:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5421DF75A;
	Fri,  3 Apr 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da0HZ+qJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A21F7569
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219459; cv=none; b=ngbrfEvicvjfSEDn2Z7wa0DiCViXoW7tB+zboSyWRySZiAdjPpOEN2e91uCrPGQpAQq3JiIJ44+k7duPWY9NWSURKXzZ6lFklIy2dEhRHloxvzlaE5bMnkC+lpgT/vTV+L3N2O23nsX/P0KMF7K/J7XcBgmg8NFmlOdMGA4b/N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219459; c=relaxed/simple;
	bh=VS9pfMFuyZsgPN38Z8igq1cZ8glbt0dZ47Ul1m2Glkg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHhh3g3uy0/iDt2r0E5+AtkY590eSg2Fo4UnY8nq4gFT8bXuYceVt3VsK+TvcIRnofXTV8rfQfW3u6GSuSYR0gMyMDPPK7WbvLO5n0JpfXu9tb48aTCSwEe9AO9Tq9nr8fwg+RVxXx9iqquAphGYtfCsmZ2SXvhkmtNELqJUwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da0HZ+qJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17224C2BCB3
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775219459;
	bh=VS9pfMFuyZsgPN38Z8igq1cZ8glbt0dZ47Ul1m2Glkg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=da0HZ+qJxU324pDljVjZUQPAyr9uUfbhw9d3ZPmddDnciOr+6ZyIDOzZFXRNRV/Gx
	 DQLLGbTzCZ1c9qUUdmcQUKRnK9OCsjvmeAHBKMpSJev6ywMNJmPG+UynymDzv8rWu1
	 pjs4pzJMSkDObiuYFzwtzYZa7mLqt8xbGuh/xxDJdcfqoKqgyu5T6Koc4lSrMYMhRb
	 uO2L4wEfwRO2LH7LhozZILIzcB6saDzlSBhKUauyGxHnRX3HCqU2ZT/CJS26FTGjFr
	 E5033VktcZjD41GoorBGncnk0+XPA00LwAAxG9NId1mtJilZ6H5S9097Se31s6Pd0M
	 dn4AkQm3KntBw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso15378591fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 05:30:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQVdU6ahO3mBot+B62tAVyKx6GnmKFRlEAnRRMgaUOaXcrDZO+
	/p3tl9oG/JxUR9iQwahNgw9MC9CA6Bx9e844CXgGhCGwvMaPx4y45w/VMNxu9YxtAHDMizaPLJa
	HBzdXYjVJdAv6h7fE1QJP9Iter4R9aCErEOPIXoMMRA==
X-Received: by 2002:a2e:a105:0:b0:38b:50c7:8237 with SMTP id
 38308e7fff4ca-38d91c196c8mr9552661fa.21.1775219457818; Fri, 03 Apr 2026
 05:30:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Apr 2026 05:30:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Apr 2026 05:30:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260402094518.GT3552@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com> <20260402094518.GT3552@black.igk.intel.com>
Date: Fri, 3 Apr 2026 05:30:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MekQqNXM1MRfFOgF-3Vp_TX46soqLvKGfXZ=1P0XyFJPA@mail.gmail.com>
X-Gm-Features: AQROBzC9o1xTrtaaBc5jiTfBugAPfrGi2Oy_VZpi2QWMjQf4GEG6ty7ZYgWn0qs
Message-ID: <CAMRc=MekQqNXM1MRfFOgF-3Vp_TX46soqLvKGfXZ=1P0XyFJPA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org, 
	andriy.shevchenko@intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34638-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B10AD394148
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 11:45:18 +0200, Mika Westerberg
<mika.westerberg@linux.intel.com> said:
> On Wed, Apr 01, 2026 at 07:45:26PM +0200, Alan Borzeszkowski wrote:
>> This driver provides support for new way of handling platform events,
>> through the use of GPIO-signaled ACPI events. This mechanism is used on
>> Intel client platforms released in 2026 and later, starting with Intel
>> Nova Lake.
>>
>> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>

Should I queue it for v7.1 or will Andy pick it up?

Bart

