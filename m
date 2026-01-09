Return-Path: <linux-gpio+bounces-30372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F2D0B902
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 18:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D75630609AC
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 17:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24533659F9;
	Fri,  9 Jan 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeazqGNL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSgb6EGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4C3659F2
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978881; cv=none; b=Mpgqdtcv08145SMCSnSej3GEzxryn/2NkGVF/RufMI02zVIruWWiYYhPfUkQKfmO6/K2Bbvv1VvNNi5jGGnNco0jf/DHviCqo016bXf2rkvSrvjaWXRxyCb1lhfPfW42uQiXynJ54SbyLsjYtF1uA1BQGHrSOs+bp5xfwFqM2+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978881; c=relaxed/simple;
	bh=F7zcGk8nCH165bG+Lq3YX1vuc4Qm0989LRhZOuxR4Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diI8/NK0jyLhe5HLktmrd9Kr70xMGeRsUONAA1j0gCabAZjNVdFqzHJI4FuZkFn2TkhrQ0G6YXzOv7JjuB3UAgCKjVg6PSwTXvlbVhkRLbhW127JDLsENZQ4YHcd2/ZE/5GZi8mqkuYw71A0W98otPbizYHUZDdt8TUfeR76PjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeazqGNL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSgb6EGe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767978878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
	b=AeazqGNLs6R9hsYax8J58O6snCHIdtbsEJk1z0dRPN475Xe1WGO5ZUHkINc8KhEaLBK+GW
	TDBBTRf86svvG2oqDSYgJeBd7jZNiKFwXp8VfHcOH/s3jbk+UCrZChaqWNH+Hr92yvuCpe
	SCu7SptAfa3McqUjlMhzI9DIFue76iw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-n1OjyCpiOXm2isjqlLkkew-1; Fri, 09 Jan 2026 12:14:36 -0500
X-MC-Unique: n1OjyCpiOXm2isjqlLkkew-1
X-Mimecast-MFC-AGG-ID: n1OjyCpiOXm2isjqlLkkew_1767978876
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so515577885a.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 09:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767978876; x=1768583676; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=MSgb6EGeh8JT3IbLKfH4m6CAu+Js0nnr3SoBBcPnaQU8c1LnlqRh1dGBm9UK3849GL
         2F7fHF6f+YV5RlJvlmFgwUQN2M+IU2WfowHmtq1jXIXe8uuq9sEdgcYeVofDRiGmqM3U
         SrvQ204jUXmCTbbJxynwSK4pTs947d9OH2xnBOqvA1dOz19pG2opZc2dPapF3Okos/lE
         LrXpNVOnOFrkUlSgyTrFHN/Zbm/Jg2uNz1iyOVmaEOuorO2ViVR2J3IeGdOVbAHu9chp
         OwBqDmZ3LcTj/kYzGtSXQ0PDWqpHXJMTnce1o0WPxR4UY+C2dncvyGK61g1s3Ceb5Qgt
         UM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978876; x=1768583676;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSDwbxYjO8+HiZzQaZwthav/1dzwRPtawpHAGU+oOsQ=;
        b=u+eYytXMgnQgncb7TLIipFgIVcQM9kfRUsIBWGuB43UZEdnQiCzQSelaM4qllaADv8
         iOi0zSXc9yBIopX6ex4OhrQ2aZAucQbuNPClob11kxNTan3ifJFZD2uiQygSh51jqBHy
         1MyuvXKMFuAUIxSMRZO62/bPZDl/WjVYuGXrwDi3x+G23yYqGOt+F0MzmU3fuq6cc/GH
         87e1ebZdyVg3VC/CstnGHI9wOXqy/70qvQTKC+SS4YQWoHe0ax/aYh+S+m2GTPiI1I2z
         wzw+l0h/sUmUJ63KV9bSaWq7EQxlkKCCGeQ2UKMPNIYIkCf+n3s4D4DktRyKvSOQCEer
         +ETw==
X-Forwarded-Encrypted: i=1; AJvYcCXm0wEcy6XorG3lklAqb3sQmpi/TVM8xAKAUOBRzSHCQV4rNjTHOEjdFVwL0Y9ZF8c4DByOXCM/KK3g@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgnb59KfGK5vs5Rga9PRnLnNqdMkqJSGYJS4Omn0vDLKDH2IgO
	wQQmM6+9Oy2QqG9wqZnqs3R6cTZTPGmePFilaqZ/7oi0eoXkIvIa0cheIOPobgCFyqeJur0Ct2u
	rXpB5KpzkU1nhie4mjuM4rB73S324oMg3o0xVtS9N3XKHp/S6m+vD7er+0YrumE8=
X-Gm-Gg: AY/fxX6qsrYLqo6NzDNBUTZBltJ4AojbxbmztmWryTvP1paCyumkNStRPJSKReKoRAr
	1tNeMS6kAYcR0gi38RnTrTW/GK5nJtb+WnC+LKN/8tF+vfoI8XcLk0RFcFkj3IaaX8T53X8OUwt
	n3dIsDPqTS4S/fWweFfgPK5cABSYxcg9Y5qUj8vNtO+UWTknf2npStdqUS6LD/IoZLtG2CTG/PK
	seEZ35HDUIQY/AwZms5nHKPnUmckDuCLo+ujukDpI8j08v91FfNpoORAhFyplf9fv3SMYo3QIdb
	HTBZ0hM0T5YmA9DYEXJFK/Gd4U2tjaw0+RZEoTzBORlKeKU6gIixTLxFa5MpSBNjyDsN4ORqFgC
	pkwXg/Ydt6VJH6nsXoDvCQb3NqaDeBDCxzH/+RK0CplMc
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217150385a.79.1767978876329;
        Fri, 09 Jan 2026 09:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHotayWWfWtWeRCvw1eejr8Fm0argOz9TlIuQkrGTqEF91Uo7p3dq/qiwtr88DHNoO1lgXL4w==
X-Received: by 2002:a05:620a:4109:b0:8bb:a675:aa61 with SMTP id af79cd13be357-8c3893fbb30mr1217146085a.79.1767978875890;
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726041fsm82384206d6.45.2026.01.09.09.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:14:35 -0800 (PST)
Date: Fri, 9 Jan 2026 12:14:33 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/13] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aWE3eWL_8U33TcsT@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 09, 2026 at 11:41:13AM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers.
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.

I didn't CC everyone on patch 1 to this series that copes pic32.h from
the MIPS ASM directory to linux/platform_data/pic32.h. It's available at
the following location if you want to see it:

https://lore.kernel.org/linux-mips/20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com/T/#m1e0e50adfe2ea4bf430025660fada7b1468d0fbf

Patch 12 of this series is where I remove the asm variant of pic32.h.

Brian


