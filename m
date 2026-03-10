Return-Path: <linux-gpio+bounces-33005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMB4IjEwsGkShAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:52:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3232528C9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 15:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A01731C0B06
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0C53B9DAB;
	Tue, 10 Mar 2026 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n01BZbqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC13B47F4;
	Tue, 10 Mar 2026 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148339; cv=none; b=DHKyxhlzpuTxas+J/zcB12zZcUuabPFMOeQO3mhyFfU/8imi39uSiQBVbaXhbQOV6vVZZn8TCrgtykxy34uQWfPr2/ZEx8EB9XbW20ZYEdyq8M7VWbAek4u7uL0xbbIP3h6ihr/2e4MzRdjZwVY/ezPR6Ftyo3eCSgJYv5uPi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148339; c=relaxed/simple;
	bh=UCrvqDTE2mWQSmNtDW+IFhtr5uMp361BypDKZD3F6VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayaEAgIYGZq4JpEKU5vO0k13XmWrAlKi+AKVUKCPiL1D8iE6SYkkgNE4W+Bq09dBhWo5dHkKL5cRneWAgNH8Nofo9iPgfW+jezajai9xjNoFWZIde5kY5uFPUkFb3pVnj9WfIupjynE3Vst67PC59WF02cP2h6e/WBls/z+18k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n01BZbqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6E1C19423;
	Tue, 10 Mar 2026 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148339;
	bh=UCrvqDTE2mWQSmNtDW+IFhtr5uMp361BypDKZD3F6VM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n01BZbqcf6lH6Y9t6V/Wa3cFb8JZRMl33wuesviLVbgqilaPOBuRtP2evqc3VKSb0
	 fRtJGvDZH+eLvat1XrTo6eD8aafqI4CwsT/gkrEJs0m8T/O7+gED1eGPx9+/d1Dluf
	 z8AutcQFDk6jqYBxLktI1QS+u5LSEHmG5CzVobloM8ErK5YXPTPc//XnHU4olp6SJ/
	 b6Gkl6+UVxATwr5b+wXxLovICSPnR/riG8xjro1M2GrA45/dWxeu56UWyG9wqbADN6
	 uR2IZDQ20umCVIcvA8xJe3nd4ey09YX0hHFPL/zD2W4Chg7Ihq1f97avExQTZVJSFy
	 JSAlaNFPcrBUg==
Message-ID: <d17261f5-a423-433b-8595-0de63200011b@kernel.org>
Date: Tue, 10 Mar 2026 14:12:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: i2c: ov5675: Wait for endpoint
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org,
 linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, mchehab@kernel.org,
 dan.scally@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260310124427.693625-1-antti.laakso@linux.intel.com>
 <20260310124427.693625-2-antti.laakso@linux.intel.com>
 <14af1139-cb61-4519-a769-23796ecca3e2@kernel.org>
 <abAX3WVzKgTIynW7@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <abAX3WVzKgTIynW7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8C3232528C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33005-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi,

On 10-Mar-26 14:08, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Mar 10, 2026 at 02:03:30PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> Thank you for your patches for this, cool to see someone working
>> on supporting this!
>>
>> On 10-Mar-26 13:44, Antti Laakso wrote:
>>> Defer probe if endpoint is not yet available. And do it before acquiring
>>> clock, gpio and regulators.
>>>
>>> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
>>> ---
>>>  drivers/media/i2c/ov5675.c | 16 +++++++---------
>>>  1 file changed, 7 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
>>> index ea26df328189..81916fa8c117 100644
>>> --- a/drivers/media/i2c/ov5675.c
>>> +++ b/drivers/media/i2c/ov5675.c
>>> @@ -1181,6 +1181,13 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>>>  	if (!fwnode)
>>>  		return -ENXIO;
>>>  
>>> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
>>> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
>>> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>> +	fwnode_handle_put(ep);
>>> +	if (ret)
>>> +		return ret;
>>
>> This should be:
>>
>> 		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
> 
> I'd keep it as-is; see
> <URL:https://lore.kernel.org/linux-media/20260310080038.1182695-1-sakari.ailus@linux.intel.com/T/#u>.
> V4l2-fwnode also prints errors (albeit on debug level) on failures.

Ok, keeping this as is is fine with me.

There still is the issue of adding the goto-s to properly free
the bus_cfg on errors.

Regards,

Hans




