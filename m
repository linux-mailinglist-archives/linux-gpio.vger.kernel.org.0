Return-Path: <linux-gpio+bounces-34901-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO1aJRyk1mlUGwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34901-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 20:53:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E15903C1D78
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 20:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 622C33009F01
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 18:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1117B3D9047;
	Wed,  8 Apr 2026 18:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOc2S0VQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C316E3D6CAE;
	Wed,  8 Apr 2026 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674388; cv=none; b=Pcg7M38LdAFBiVKIwyhTI4ptzUei3JLGOrtidCpmuDnI77ZSVMPxC4tgv774XwPICewnbDqLH+Irh4rD6t0DWmEUS5WMtfj13OSOhSy5d43xwzutD9DqKuIUL9JEkckS95S/hjcOeHBLhlrqqoZxx6KqBtM7scOW3pQn1qePHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674388; c=relaxed/simple;
	bh=HOaJwNsjIpDPz52IfHQIEoSXM5Of9dRAnw+kAgv7FoA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Bl3KgbF1KdezES6fadnP+j8IEC/5/PMNbl/nGE82NQuZqMB/8UUvfu3iMmAcBNk3Ev0CgJYFcp7U373h1qQciP32j8LC0AFSaz22QCHEWc9MOD8FbxxJZfCTTkdBXkImOvSUTSTQcd58PM0o/4upDOq15ER7tJEwghkOXHMwWpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOc2S0VQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2D4C19425;
	Wed,  8 Apr 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775674388;
	bh=HOaJwNsjIpDPz52IfHQIEoSXM5Of9dRAnw+kAgv7FoA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GOc2S0VQ1U2YoZg7PcnTbrQnVGbUcO0ya9PcSKHGTfE7Kv9GaqjvCeNz+eK9+vpPz
	 S5N6OoVV/ezdaKz/WOQOZrj3yqe1gqTSV9TTQCgKqZRFdTLEF26/f28LUdw6b4z92T
	 BDOH29BJ6kHn3y5Skx3u6omZMdb0vMRkE1Ziv49iHcjLNR5vCRMtSxKPHD2cExhBTG
	 +1StX143sAUnYT8/M5Wx7tQVUy4mDNYkNuAybbss2CTVWAM+bGR0W37zY30oj5HRSj
	 wyeDitfgp0lWz5tM6aa/8FrT21LqtUx7A0hFMfGO08tvE3U3zQ/Xra5MToyCx7OHKQ
	 pLHasyNKqyU/w==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 20:53:02 +0200
Message-Id: <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Mika Westerberg" <mika.westerberg@linux.intel.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Len Brown" <lenb@kernel.org>,
 <linux-acpi@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <platform-driver-x86@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com> <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com> <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com> <DHNVOVO67YMW.1Q763BB153CGF@kernel.org> <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
In-Reply-To: <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34901-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: E15903C1D78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 8, 2026 at 5:52 PM CEST, Bartosz Golaszewski wrote:
> On Wed, 8 Apr 2026 17:28:46 +0200, Danilo Krummrich <dakr@kernel.org> sai=
d:
>> On Wed Apr 8, 2026 at 9:19 AM CEST, Bartosz Golaszewski wrote:
>>> On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
>>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>>>
>>>> It's possible that at the time of resolving a reference to a remote
>>>> software node, the node we know exists is not yet registered as a full
>>>> firmware node. We currently return -ENOENT in this case but the same
>>>> error code is also returned in some other cases, like the reference
>>>> property with given name not existing in the property list of the loca=
l
>>>> software node.
>>>>
>>>> It makes sense to let users know that we're dealing with an unregister=
ed
>>>> software node so that they can defer probe - the situation is somewhat
>>>> similar to there existing a firmware node to which no device is bound
>>>> yet - which is valid grounds for probe deferral. To that end: use
>>>> -ENOTCONN to indicate the software node is "not connected".
>>>>
>>>> Acked-by: Andy Shevchenko <andy@kernel.org>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>>
>>> Hi Danilo!
>>>
>>> With Andy's Ack, do you think you could still queue this for v7.1?
>>
>> Yeah, that should work, but I have a question about the patch.
>>
>> The comment added to fwnode_property_get_reference_args() says:
>>
>> 	+ *            %-ENOTCONN when the remote firmware node is a software n=
ode that
>> 	+ *                       has not been registered as a firmware node ye=
t
>>
>> This seems like a bit of a layering violation to me, as it makes it expl=
icit
>> that this error code indicates a software node, while
>> fwnode_property_get_reference_args() itself should be agnostic.
>>
>> The caller can easily derive more specific semantics with an is_software=
_node()
>> check as you already do in the GPIO code.
>>
>> Can we describe the same condition, but without explicitly naming the ba=
ckend?
>>
>
> Yes, sure. It can be something like:
>
> 	%-ENOTCONN when the remote firmware node exists but has not been
> 		   registered yet.
>
> Does this sound good and doo you want me to resend or can you change it
> when applying?

I can change it when applying.

One additional question though. I think it should be fine, but are we sure =
the
change can't regress other subsystems? It seems some of them (e.g. sfp-bus,
v4l2, iio) special case -ENOENT.

