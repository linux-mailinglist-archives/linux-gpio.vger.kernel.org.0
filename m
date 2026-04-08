Return-Path: <linux-gpio+bounces-34892-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLphMLt51mnxFggAu9opvQ
	(envelope-from <linux-gpio+bounces-34892-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 17:52:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63F3BE85F
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 17:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F46D301AF47
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 15:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CF32DC764;
	Wed,  8 Apr 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLWzx6rJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB6285CBC
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663529; cv=none; b=EKBPTyV2duFQBc665InrBka5PNIZOAUxC0iZwfhoRE3gaNBeEK3WqUgcXDoUdBJHCXHC8BEgWRZlfI7/TzNfLSfl2kFgcrBvaOqGF+uZ12ENq7NI3GBEwFtYn1RYUe2uDPxsJQcovoCpz9NrbyQAMTx8iIauNNMSFbUjcU7c904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663529; c=relaxed/simple;
	bh=wDiR4ygCxFqa9Z2EhsIwn3+PgH8wQSa11TKy3LcdtZE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIX2HRsQF6L5/BU9aR8JSEDhNrvJnR2HwxQSDrVQ/F+8LXe2JVwrFtrsX5KzYcEi/heiLmlT2Z6kGK4pzJ7kGWdLOD/HHdsONwJWBH/TMOnLxvWBmhiXlVtyzHn917SCM1qUwrPFQh6iU7radVs6FMfwyS7TsuHkLsYfQLltodk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLWzx6rJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563C2C2BCB1
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775663529;
	bh=wDiR4ygCxFqa9Z2EhsIwn3+PgH8wQSa11TKy3LcdtZE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=uLWzx6rJE5BqWVeE6W452kV4ic5PrsyKyz8uESVJdzYgpuvBcze+QxlnD6nJLabNQ
	 IXNxxhwzDF/I3yVrL/RS+CakL3lanGVaPmV8XkR4WIFPDIIdR/uOj4wQuDsNzRC1Y0
	 j+qqWzATth+LUh24AtOBNix5awTqZ3Tsk8zYROtQ1KU139yXcrFxxhD7lBJRMXjE4b
	 p6QItd/hEgoT/kC6/208Vj3XKcEKtaHtQhSzj4E7qMsXV/jxtX4lNzRwgtBGbGMubL
	 r0Uz3m9izHP9/i/TM35z1/H5shjB3qivBIrQqMvd+SCaW1KXwR6VAyfgK0n5iMfU//
	 T8aUBb2blypjw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so5699151e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 08:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3A4G7pXBSStUsdUej6pRbdNkAowAh9nygtGLTe0eNG3dg6YKrX9i0znP+0blHDT+lz8RmqtTMGKyw@vger.kernel.org
X-Gm-Message-State: AOJu0YyrM37DGYBb11FROof97tGAuS93rFABjKKTabERJ68M+6dCrIZw
	GKbFOnyjuhGPs7A00ltnfPjHsndUEedDJRRPu4tF4gNS620dw+h2EjDLtqxuGINpXjlNApYCyyl
	R4ETFaMqcKGLVydAB5O2FmfQU6d4o6z18FvnTOqIXSA==
X-Received: by 2002:a05:6512:ad4:b0:5a2:b0ba:7169 with SMTP id
 2adb3069b0e04-5a3e7c4e394mr24919e87.38.1775663527749; Wed, 08 Apr 2026
 08:52:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 08:52:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 08:52:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DHNVOVO67YMW.1Q763BB153CGF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
 <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com> <DHNVOVO67YMW.1Q763BB153CGF@kernel.org>
Date: Wed, 8 Apr 2026 08:52:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
X-Gm-Features: AQROBzDTUrFlRk0xCpRN_C0GqGwVoKiZ3-raj8rKD_my0S47cg9sJMqXnJQ1eCE
Message-ID: <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34892-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A63F3BE85F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 17:28:46 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Wed Apr 8, 2026 at 9:19 AM CEST, Bartosz Golaszewski wrote:
>> On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>>
>>> It's possible that at the time of resolving a reference to a remote
>>> software node, the node we know exists is not yet registered as a full
>>> firmware node. We currently return -ENOENT in this case but the same
>>> error code is also returned in some other cases, like the reference
>>> property with given name not existing in the property list of the local
>>> software node.
>>>
>>> It makes sense to let users know that we're dealing with an unregistere=
d
>>> software node so that they can defer probe - the situation is somewhat
>>> similar to there existing a firmware node to which no device is bound
>>> yet - which is valid grounds for probe deferral. To that end: use
>>> -ENOTCONN to indicate the software node is "not connected".
>>>
>>> Acked-by: Andy Shevchenko <andy@kernel.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>>> ---
>>
>> Hi Danilo!
>>
>> With Andy's Ack, do you think you could still queue this for v7.1?
>
> Yeah, that should work, but I have a question about the patch.
>
> The comment added to fwnode_property_get_reference_args() says:
>
> 	+ *            %-ENOTCONN when the remote firmware node is a software no=
de that
> 	+ *                       has not been registered as a firmware node yet
>
> This seems like a bit of a layering violation to me, as it makes it expli=
cit
> that this error code indicates a software node, while
> fwnode_property_get_reference_args() itself should be agnostic.
>
> The caller can easily derive more specific semantics with an is_software_=
node()
> check as you already do in the GPIO code.
>
> Can we describe the same condition, but without explicitly naming the bac=
kend?
>

Yes, sure. It can be something like:

	%-ENOTCONN when the remote firmware node exists but has not been
		   registered yet.

Does this sound good and doo you want me to resend or can you change it
when applying?

Bart

