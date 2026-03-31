Return-Path: <linux-gpio+bounces-34487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPEnK3Tby2lHMAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:34:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B836B082
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2040030458F1
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02D83DFC69;
	Tue, 31 Mar 2026 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7eo1es6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60067329E4B
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967642; cv=none; b=ZdCnbuNfBIEkG284+YGt5rz7hqold4Yhi7/86npnAnVPfZzwzRy1Im+VxIgYjB6DgjTN8QDaUhU5SVnB2gxZo1onu6DifGrr9/IokdsWarDOW0gEsxq+yeFdd0lsLRaGPeAXLMrHk2ykexzAluYh5kKi1ImvGyj0sah9oNJZtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967642; c=relaxed/simple;
	bh=7QyT5y5IdVGl5TzBMiqcHoPN++K1BEB+3G5SBMmIV3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjubcyrbnCWnZVv38kcKAHj4pJQYq7H8w5SeDx3A2k71QVR9ghZ6u4iy8JRg5Ql9CyvoiLT05lIeQgWvgGLMFie/Wnp7E1PzX32gthu99KDtue+7KlGjeim7maICbwZCVaNx6Z4QExI9kP4fzKbnSe1AAsohhMFyyQhtNZvZBSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7eo1es6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2adff872068so24069115ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774967641; x=1775572441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIKZrQUV999cNYN5HmhG6qaejnSRA17IrWYvv0z6dB4=;
        b=K7eo1es6Y2rpeszh+QgzNujvKQXXwUlNVavKy6ibgpk+rTDOU/5j3h4T9i8gKhh8YB
         XcGjznYxFtOHXUWhx5loGkJ8S9fHVmN/6vIsy3kynHIeU9k7u1DW9R2BxXg5bZNXbGlr
         JM962gNJnoPJ7wzGHoeI3dp1TttjmN9cB2H2KwYT/2UmD04qthzVX4llU9Zjvl7l9lMe
         zzJ3XxrGm5BEnu9ajNd9RGVA66bjCewLxn64P40jF7cw+PX1dLGm5dKp72GCFrscRZuw
         WHVtFcLq/YCPtlubfwsM0As39ZUd6jCO8NVCIOdp6pjzizAmHL4m8KnVLtYbKKzDZJEP
         xH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967641; x=1775572441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIKZrQUV999cNYN5HmhG6qaejnSRA17IrWYvv0z6dB4=;
        b=KWneAw84LlGox0KNPNrLboFgz5TPdbynFNlVpKOng/GhnMEqsbzF2iPMJaVtyphM5I
         +7StTQPjf4H2NnWRE4XkZyfYB259FZbfdhOnEO+AUXo6v03dgOfC9A7N3G0ZyWlmxqln
         EYBoLIzjlsRJ4TwpVjZ+sBKzKOaZpBcPR4nBppXHMs+v3BRk8q2JZKhB4dag5zbIE0+j
         pYtw4LS3+S8/I+VSCwzib1efPWidFIQfcRsfPNIuRKZS1jm2tEVVpSqO8V7pU3+Dusdk
         LfJEKiiuKmVMbygUvSxQtLmYImAAOrd5wS/cDA2vighbYyBaL+5zA/zKuys5NfRUYdzy
         wehA==
X-Gm-Message-State: AOJu0YwBuopsO0A6ef+15nvJjyxqFFgrzh6IUFncCEshB+VRYv0+aw7e
	uRZ9z/+HUv8WO8jaXPXmpa+S8lc3WmelKUhZNFgXdtwTS4zK0k7MPFov
X-Gm-Gg: ATEYQzy6ur69KUTmRdQ4Kp4I8918iGJIJnbjO/iDzoaMhH89tZUfTmkLOhSKTHU96Np
	6VXq/n1Ym2iZPtHvUwBxT7x45AR4OhuqyfkZCbf5nx+i4uLEg8UFV8wTo7mTSS5lo5BB9ydzKSi
	qP35zxdTheeFXGeq0wrdGWaC80LMiEGPcS6Hwk3XNtDYQLNtAQ9gXbnrQzs7Z14rfF9J7d6zVb2
	9fg5pfzj41TNF7lhOt0j1XXYml5cCW6sL9qWr74xj2HhDsxINuEgfamGAHutdW2D6JDIRhml79W
	fqIwUePIIHihnANjkSjlK/smZ/WLgs9ZVXMbGW1M0tI2hgHNX0G0jQnHBWERiXk/ygTaVYAvfF1
	7QnvWWhjM/TvCkokoHSd+ErznRWo0/iS+eoYn0negcbyaNlSp7seTVbCeFYrFRLJ/aqZ9xs54ct
	DZKsRAffxt8siuhP9TevpY3sV9D7IxbmaLMkl19bC9
X-Received: by 2002:a17:902:f552:b0:2b2:497e:3f60 with SMTP id d9443c01a7336-2b2497e414dmr108576305ad.33.1774967640575;
        Tue, 31 Mar 2026 07:34:00 -0700 (PDT)
Received: from rigel (121-44-73-195.tpgi.com.au. [121.44.73.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24266b92fsm115847515ad.23.2026.03.31.07.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:34:00 -0700 (PDT)
Date: Tue, 31 Mar 2026 22:33:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Mathis Joussemet <joussemetmathis@gmail.com>
Cc: linux-gpio@vger.kernel.org
Subject: Re: Help regarding IO configuration of multiple lines
Message-ID: <20260331143355.GA64085@rigel>
References: <cf52e066ba190f52bbfbfcfdcbdf7addc8998616.camel@gmail.com>
 <20260307021344.GA14011@rigel>
 <CAOdiGsteopFY2-A9X65cBxMKbW9uWeZvfaKbMhwFT1E5gceOLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOdiGsteopFY2-A9X65cBxMKbW9uWeZvfaKbMhwFT1E5gceOLQ@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34487-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 537B836B082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:23:16PM +0200, Mathis Joussemet wrote:
> Hi Kent,
> 
> Sorry for the late reply, was up until now in exam hell.
> It indeed works! I can now drive 2 LEDs at the same time!
> 
> I just have 2 new questions:
> - I am now using a button to toggle one of the two LEDs by checking the
> buttons value using
> gpiod_line_request_get_value(request, offset[2])!=0)
> in a if statement.

I don't see any obvious reason that wouldn't read the button, assuming it is
the third line in your offset array, and the condition is tested at the time
you are pushing the button.

Have you tried the equivalent with the gpiod tools (gpioget) or some of the
example code (e.g. get_line_value) to confirm your hardware setup is working
as expected?

> I've setup the correct input bias, but when I press on
> it, the LED doesn't toggle. Checking with a scope still shows the voltage
> jumping to 3.3v when pressed and 0v at other times. Is there something I'm
> missing?

That being the input voltage?  For an input pulled down when the button is
not pressed and pulled high when it is pressed?
That is what I would expect to see.

> - I'm trying to switch from an snapshot based line change reporting to an
> event one. however when using a watch line event before/after the request,
> the program still blocks. How should i code it to prevent blocking while
> still having infos like output values types when there is a change?
> 

You can use edge events in a polling scenario by testing if the request
fd is ready to read using poll() or select() or similar.
It will become ready when an event is available.
You can then read the event as usual and the read will not block.
So similar to the async_watch_line_value example, but with a 0 timeout in
the poll() and checking the ret:

  ret = poll(&pollfd, 1, 0);
  if (ret > 0) {
    // read event...
  }

and doing whatever else you want in the polling loop.

Cheers,
Kent.

