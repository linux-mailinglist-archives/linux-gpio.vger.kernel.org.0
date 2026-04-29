Return-Path: <linux-gpio+bounces-35741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE09LLd28WkxhAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:10:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850648E951
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 05:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 330DF305615B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 03:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E45D36AB44;
	Wed, 29 Apr 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laptop.org header.i=@laptop.org header.b="qqyii7yK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422F2DC32A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432071; cv=none; b=ORkA4e1Qpo0nQJerxfqkg+iJKfoem31g56WMY3aHFBcAT6L7MF5nTHk945CnOoaJdfX0KutFj5GqUC9esg6rF+ZEKHrp8URgXyih+k3JHvmVXmbZQKV3Ls+M5MtJsVaGql4cxDfClA+TpdKtCs4wqSoiM5TlA7YHMGjAgeBuSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432071; c=relaxed/simple;
	bh=eTuqcpRT28M1Kh8simf9Vs58Tet1tvIeFtM3QLaqPqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WetpTZSNy7Dn/S5fOHkbMJNy0hlEa9ftqTkDFrKW/aOYyZF9xNMvg/GhsF8pziWewEBwNLWvHzRZuS/uSmLGuw4pDSP/nXFK0VQmPiZZC5pLwtX4iH2F/w7SY8lr6AJMstj+DRGYpiEclI+bP6oAexMsrCHAviEqFomMvI5TrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=laptop.org; spf=pass smtp.mailfrom=laptop.org; dkim=pass (1024-bit key) header.d=laptop.org header.i=@laptop.org header.b=qqyii7yK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=laptop.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laptop.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f8893bff3so5666706b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=laptop.org; s=google; t=1777432069; x=1778036869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPtxRFuWaKXZFarT4M6cqYcLbh8ZqBRpSWemDoC/VHQ=;
        b=qqyii7yK7Rxm6GUatIwXsrEzCwyVtjSQHJijAJ92s3tAFKPw+AIw3wZEHtj7PWcBpk
         OLhKmD3tfAKcyuPay5/dQTP5hlNc/iFm2+6/YRTa/uemVhbQMomf5sFSVLkjL9n/kyv4
         NngU5ds10cZl7W5DzuJ5zIe6zXj36eHWBf23g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777432069; x=1778036869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPtxRFuWaKXZFarT4M6cqYcLbh8ZqBRpSWemDoC/VHQ=;
        b=sLr0rgYdpiGTX8/zw19yHqvFVJW/gpsqRlHd1zrgGTAUrUzj/kMgxQVR5ySaSlshdv
         mG2BzHI0z6vxXWpy3N+ks/4yh00MM+P0cXTAgs9yHUCVohn0umjfY3bQm/mLm2bsdo1Y
         LJfrmOBJ0VzUPh2B85bb3QCgGzlSKdn7Q0wTv6mXEnteJJoKwDKYm15xC6I3PL4hNus4
         H5C3AbPenCTEBd6Oy7sPQwOxEKjshaVoR8cfFrDyDaZP7TQz57EUMOmAwHDfprlxkPKO
         A6Kjj/q0wZUGhhevVRE0ESORCi8kX10TNIlhNf++TcT+0W5ulAwyQSVygnT8v2jKUEGf
         U8qQ==
X-Forwarded-Encrypted: i=1; AFNElJ9a0GBg7rY3Wy2jB3/7P576LviIvgFlKnYHxlln5hFoaFTIihR7XsmuYZ0t+XhOqaye6w9rjndFiEQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YzDGCFIo2MRYV9ek11nGyewgY97mIhovm4EaZoQEHKSqZaOs4Rg
	RlObMIj18s+gGXDINmgEoifa2UHki/8lnxIUAEPSYmDXUO2B5ay5jvIZ6UCYpZqs7g==
X-Gm-Gg: AeBDiesZVjunt1OcxDmFS6QBmMT6EAlrkkx8iRzaRAVbwtyy0orVZvt/Bey88OpiCp9
	/ORhoSaagLMeHpgh3G5MBnEbSgYNY1KEw2h8mxDoz8KKKWPu7VzVLwJfQHebNiHb1DQJEQtgQtm
	Cx5mQ+ZSOk0grWlNUaNgAW5ULLjqNa0WmtrQLzHEcSBUym2pXXvMZPHthOlrLuZBeF/5gfdSfHx
	STAGB/y98cfz2X482r43Qv2FzFRbDwd3cDvnuPoIpxEj9+PAznC1GZp2OUpXFrtbjJfvjXekpP0
	YB7IQv1op9CC0MEswvyVc+Grdi/aVCy6fTgqBJcR/Bb/B8vJgKoRJ8hWwxNbbRjH6MFmfffyDTd
	WzjC+A81Uxr/eRyT/dyDwG7flEVwS26+KpSBB2+au8y0ePFJC0j6J82EGS95DLqXJqbyk4SX8IM
	0S6K2FzXGk9nP8G1tTfA==
X-Received: by 2002:a05:6a20:3d19:b0:3a2:ecb8:56d7 with SMTP id adf61e73a8af0-3a39c2eac99mr6460712637.45.1777432068915;
        Tue, 28 Apr 2026 20:07:48 -0700 (PDT)
Received: from esk ([206.83.114.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed59fd3fsm455067b3a.8.2026.04.28.20.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:07:48 -0700 (PDT)
Received: from james by esk with local (Exim 4.97)
	(envelope-from <quozl@laptop.org>)
	id 1wHvH6-0000000BIo8-2iCH;
	Wed, 29 Apr 2026 13:07:44 +1000
Date: Wed, 29 Apr 2026 13:07:44 +1000
From: James Cameron <quozl@laptop.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-geode@lists.infradead.org,
	Andres Salomon <dilinger@queued.net>,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
Message-ID: <afF2AEZ-iZibtbDT@laptop.org>
References: <20260427144338.3436940-1-arnd@kernel.org>
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
 <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
 <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
X-Rspamd-Queue-Id: 3850648E951
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[laptop.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[laptop.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[laptop.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35741-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quozl@laptop.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 12:34:53AM +0200, Linus Walleij wrote:
> So if there is interest full upstream support should not be
> hard to attain. But it requires some dedication, and I wonder
> if such exist.

I'm still here, keeping infrastructure running, still have hardware,
still receive telemetry showing children using our Fedora 18 build
(!), and still answering technical questions.

But we don't have funding for this kind of work.  We now buy-in
laptops.

It would be wonderful if keeping dcon happens, but I have to be
realistic; whoever does it will need to be very dedicated to acquire
second-hand hardware and work through the various other things that
stop the modern kernel from running on it.  I'll cheer you on if
that's you, and may even help out by mail, but I've other funded work,
so my time is limited.

Good luck!

