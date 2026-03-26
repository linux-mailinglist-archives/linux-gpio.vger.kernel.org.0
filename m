Return-Path: <linux-gpio+bounces-34225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLTBIuWIxWlc+wQAu9opvQ
	(envelope-from <linux-gpio+bounces-34225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:28:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992033AEC5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 20:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD118303D897
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 19:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF121351C3E;
	Thu, 26 Mar 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGXSrCfF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD05346791
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552954; cv=pass; b=bwqw1rZasgU/BGD9BhmSOp3PKx/ahvtRb9Jxm9tuTZF4KWObI3xbtTdvp2x321NTSTR+/bAvlDcX96HCr31PhCeP0eAh16tDaQj0esYB18NXwKPEjn+FV8hugZGwr7zuenHyzmpuInA5AO0KbHwLSWXBbivQ5etFVmoOKHEpOQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552954; c=relaxed/simple;
	bh=xrCrjSplDANvqfLantwAW2gMs2H4/I97Gi3JHLIu66Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtbyMkSVrPMQKJIcIr8/w7bFQ15zR6fZSjvcklKKssPCgSCLz+yaFWvTvvvakJuvXqvGJPPTUnBiivz7WkZqdlcuE8liFNrLnUw17zD5ovVdWS0SnhNsQVYjdzI7+eJDooM4jQ5i8Aw2FO2G6kdJZGNfAMqg/ehLwFYdc6AaWm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGXSrCfF; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6686697f578so2168466a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 12:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774552951; cv=none;
        d=google.com; s=arc-20240605;
        b=H1Kg78+3OffyFFBypLKSifwvd0vWGE/pDyPwEV4aWsru/E1nvPEMAN2si5UpKZu7Mx
         FrQRpi+jwCWGnQrO91D9J03IWfX+8TKhHlXWS7P/rkhv5mSO33EsADKVz8G5nO3wegvp
         rLmnM7/m8vmyq8GP9u6xtAZtD0fw8AO+3wvfmCoyqZ8xYWai7zCWLsAtWxxN46vcvG79
         /NOVSoElxhBtgXDiwsFMsteSc/A0N8DTckylXAWvkPSWUXOtmMchQnDvy0XQHY5KcZ3y
         aA+C98C0I/nbXDYtqR5BtKXC/2NEs+ZC4f7VsuVWvGgRq17BZkTlEP77IdaEPco+Zf6z
         9Xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xrCrjSplDANvqfLantwAW2gMs2H4/I97Gi3JHLIu66Q=;
        fh=nFVMuDRlyg5eVZ/Ej7q/mB/jcro5l80Kkb2jjWQI6ic=;
        b=AFL8sulJqjPrRihtOPA845A+tI143IkVn0/aI6vokm+hDY8/o6riZRiilfxbRlu2SC
         PvNOxDBYFrMPQjn61HdZozLTVVvuQT6jMFPwzCP4OA9jg36RCAOW1xnKZhmp3MOGA7Fp
         2y7RwOica+LPFthwJy7exz2S34oT+Evd2NBFDpM7aeBs9U33vw+lIHc5aU4V4iF3Xm2A
         t9rlnH31IA/VjD7PYzWyBMkhkx1pqDhA4ruteRHUnJi6Aj75bvpA/Vdc2p4z2KVnvml2
         cYTijbMbIvyOyaneHe+15VMSTJJBaPEwJyVvLhO3ZkfRLcTsNqaUr6ChjnvIn5PYCxZ0
         WpSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774552951; x=1775157751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrCrjSplDANvqfLantwAW2gMs2H4/I97Gi3JHLIu66Q=;
        b=HGXSrCfF+KX9IhnyAqd5UXgptnql+NfSmHkYC1xzgHWYZdzh24NkhbIYuRd5LgNb6l
         itDYf05SFynwuuiQsqOokbaQKtT9Cl4FEuKffrRYBjfdm7+LbjsEr20PHjr0UixgRA5L
         f+0G64wPjiXzN7mCmwFZnvPwDhk65385Ih++kqe56tJXivDGjD5/bjS/uOsaGYZHoGiy
         f3x4ETQqtJj3ncYXyOPudWGOdT6PReOKI8kRjSYLmEVXxNDZcTiLtJW+fVF1R/brVcKK
         hMS+SKBKaoa72ifSe64yJz0gTUODaPLEXBgA2PywJU9V1Jng1Z1yAMmZHxChAQhbgqRs
         afLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774552951; x=1775157751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrCrjSplDANvqfLantwAW2gMs2H4/I97Gi3JHLIu66Q=;
        b=nyeZjT+v6DK7GABCTv1oJZxI+MHpXeg607IoZcGJQctUWbyVrFq1yTj8WEE2xHbNLy
         kwSfHsMBalzE/WiaU79ZKw1B1FtmI87CGx1OhZOj+7nEZ1wrHvs6psd1QVPjmNMG0vtH
         N49w8y3fM0/IGW6+I0VmvphWl900yyF0RG8Cw6Z2N1U6QxeWSopA2xFuQYdH3uW/0eU9
         qQsD0jEDtLtQJs5uYfAum2uNsRGu+fe4dOJnkQZBtJNAYUlzDVIbC3hcVk5qijZGp43A
         Utco8iFt84siuyG1X89iGa0eHF5+7U1YxsgR4eBQo0Ha5nWEQTGMbH5X8xicet499fcX
         3idA==
X-Gm-Message-State: AOJu0YwmMfrCED83kqPWrElCJpsjrEpyfetZLzvf/rRoxk3r4VbDshqm
	HllWsWW5uXezCFvNBFV8CsdkUO+2gDkT5u8Lhx+mG96C/M7a6FCnTpytNQWUW/KUN00akENKjeW
	cPT7MOEfso11Bb4O3mB1arFPvGUtJCBs=
X-Gm-Gg: ATEYQzwd3wuGP2wuwaIlxrCuLd6rbMVqeJmzNN0hb/e2NDkmjpaOhyzwlGav++MRI0O
	JwaognHIQ0W3NCo7AZ6U6vuz2xqBlERn4FKDOjJv03UHgLMpEwrEyuk8w20VdRA/+BsBVhMW0Cx
	qH1tvwA6yLxFSs0eCf1oXUpf2ZcTng9LnV3VP/dqYwl+Ww9iqZ08vglOWLI79x2l9hE0fX3xY3g
	RxeCqWRZFaCsB4TlHYgMqwpJ6+YhohtJ9YB3SAIy8XtUqW6L2ANgpyUnNHykbgWm69boxLfNdta
	sgTG1OB8FKGnfiYaVLFxiQjBJ1/YUk21JeID8JPJ/mCdrnswAfnuNHF+/DgPuUIWBua4hGeLjE3
	dNXMe0g==
X-Received: by 2002:a05:6402:912:b0:669:ed35:e472 with SMTP id
 4fb4d7f45d1cf-66a8264c2ecmr5578534a12.4.1774552951473; Thu, 26 Mar 2026
 12:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326023627.54349-1-rosenp@gmail.com> <acUMB5OUGCpy73eW@ashevche-desk.local>
 <acUNP7ZG87rV-LJL@ashevche-desk.local>
In-Reply-To: <acUNP7ZG87rV-LJL@ashevche-desk.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 26 Mar 2026 12:22:20 -0700
X-Gm-Features: AQROBzDrAh23L9Jgw9ejZZ05EdKmPTzlhAUEhnEGA1vUCPfydEGmEBchOcwh8Y8
Message-ID: <CAKxU2N_PViOW_Frpm5AA=9gib0Gjs20RGA+0QXJc5hf8Xtp=NQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: use FAM for communities
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34225-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0992033AEC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:41=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Mar 26, 2026 at 12:35:57PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 25, 2026 at 07:36:27PM -0700, Rosen Penev wrote:
>
> ...
>
> > What I would like to see is rater special devm_kmalloc_and_dup()-like A=
PI
> > instead of doing this in every driver out of dozens of drivers.
I defer to the hardening people for that. My suggestion was to
introduce a kmemdup_flex macro that does kzalloc_flex + memcpy on the
FAM.
>
> You may start with providing a common API for all Intel pin control drive=
rs.
>
> Patch series of:
> - add a new API and new member
> - convert driver-by-driver in separate changes.
>
> Actually why can't it be done like this from the start?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

