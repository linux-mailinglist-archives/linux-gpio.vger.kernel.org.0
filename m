Return-Path: <linux-gpio+bounces-39988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMOcDLDzVGqEhwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 16:18:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31C74C457
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 16:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RWfucWvH;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39988-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39988-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6B82301FAAB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECAD42EED6;
	Mon, 13 Jul 2026 14:18:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E2B3FFFAD
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 14:18:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952301; cv=none; b=uev/VZwrJSCSJcCfSeDH4fV0DaqjopIlz+G2v+obDmV25H6/k0GfNGa/qK6dRyh5Vt1O9aSCL3qQYCPzFj3VMgW9MyiIDLpPjtRMb8CRwyRQtEcd5jlHTalp5drRZRvTnrr5D0Znf0x4FqW0Cc6u2zcDZwZOnHmUvFbccORCIzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952301; c=relaxed/simple;
	bh=EBr+StBQaquXk3XdVvkiNNyF8d/Ab7P8NnNzmXoifBM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opOLMHdRz+7NV7zFyN7r0byP4FmvYBTWu8uH11gjsBMj+9/gME2JnOPKVAS/heYVs7Wto+DQHN8DKEjjPZ/duAkBqvUphfpKIxr/KfKcFW8h4XHv+ZpamdT+4AAlYUvPBVy0DkxCLIiXsPRUwwSQo73CzYLNDgPGJdKdUDcLD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWfucWvH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047EE1F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783952300;
	bh=EBr+StBQaquXk3XdVvkiNNyF8d/Ab7P8NnNzmXoifBM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RWfucWvHD1wC9Ta+3sBXa6LGjWyoxLdWVK1Dbp7tvk6spvh2gS1NKU8NduBcV5Y6r
	 76AnVZIgGmjPwCfB5N05iit0NbZZHjKFB7U175oeqkkjRdGP+pCn46CRWMf6763djU
	 IwUjZzliugTDaA3bX80RITh7xD3g5yqGAvdDAF2BGuFSqjoH359CcFNPcf0h/sEG3H
	 rR7VfitGitBDPjzv9dpH26wsDGX5G2TN4ZV6dcIDx7phr+/HSwzVwuoe0gn6n9AfQd
	 RHbYIarntTuHDfFglumbsV/XLT7C/Ot1HgwxWyvydykZ0mRTqoyJksXmxhfUOX1JA8
	 vxniZDoavbeAw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so25536451fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 07:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqY7sP6mceZS2kCP1BqEQYG/p/ybtv07S7naAp8+hXbx/W3H2J0OF+vmlZ2gebHR3E0rQD3EnEpMVcO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tJsgmERW1/12cewYtfksLmBcZPFHQ7Z8APQa1ZDT1W2NzIMb
	wzQHnoEM8TAwzlxll0x0XUFc/snDWawEco8QuyRECN+Ql0hqQa3CkyF0x+pXMOJKSFmyM0w1HOn
	ePmeE+5vAVbnU2ClmJn/lvCWAxkO0gCG+Irha6ywR4w==
X-Received: by 2002:a2e:ab89:0:b0:39b:119d:aa02 with SMTP id
 38308e7fff4ca-39ca9f110b1mr19280971fa.5.1783952298631; Mon, 13 Jul 2026
 07:18:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 07:18:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 07:18:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com> <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 07:18:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md+DypoyJZz7FF-2Qq4OV-LpwJjU7G5m9sphqUTgz4dCw@mail.gmail.com>
X-Gm-Features: AVVi8CeJcmxzYNtE9SV1HDAWbxFYQTjog2sJp3oYHFfnP-tRYCiMD77iDC0D37c
Message-ID: <CAMRc=Md+DypoyJZz7FF-2Qq4OV-LpwJjU7G5m9sphqUTgz4dCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl:
 Add Eliza pinctrl
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com, 
	kernel test robot <lkp@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39988-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:lkp@intel.com,m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp,intel.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB31C74C457

On Mon, 13 Jul 2026 14:15:17 +0200, Ravi Hothi
<ravi.hothi@oss.qualcomm.com> said:
> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
> Eliza has the same pin mux functions as Milos but uses a different
> slew rate register layout where the slew rate field is in the same
> GPIO config register rather than a separate dedicated register. As a
> result, Eliza only has a single reg entry instead of two.
>
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/

That's misleading - the robot pointed out an issue in your v1. This patch
doesn't fix an issue it found - it's a new feature.

Don't send a v3 if not needed but I'll drop it when applying once we get an ack
for this.

Bart

