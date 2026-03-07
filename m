Return-Path: <linux-gpio+bounces-32706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MrTFIeqJq2kBeAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 03:14:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF222996E
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 03:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 540DE3004C85
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 02:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5322C2ED872;
	Sat,  7 Mar 2026 02:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtQx2ars"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099031B4257
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772849637; cv=none; b=LWzOlQ1wNPuGwzwCrvkuh1bQifngh3nyxf02CAcBmCZ+c69CI+hodyiXFF0NDa3K0z4OYtL5gWOHsS1x4yBfwWRzSMfFm73XIutqCtZwARRxn+lxfUh8vSVkJrU1SH/SGYhUQ04Xkzr8li2djm+dsvQ+nKFeySKjAAjJYKvrBdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772849637; c=relaxed/simple;
	bh=ME3X/GO9W3ihGULeNSaB90JnMzT5HTRz5nJNbqtl2zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLlvgv3QRCOQVWOftxn6G18+0jWzpYpGwPJX+OrzKd7b5MuXEZPsuvZJl1ZrjpPaLN3XyVRXsTBARXbByCKAgELel7L5o7PsVVKgYY8reMk4F6XCLe+/Izk4p3+iw6HRzEfIrfuOCX1RlWgB4aRhdfxjiH9GLPBEgx5d563V03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtQx2ars; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35691a231a7so6097068a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 18:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772849635; x=1773454435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Bflwm+ROR9ydzw/4i2++zpxF9XuMNHN2OSHTS/RCBk=;
        b=EtQx2arsrLj4fstVZx93246v7Btnouqv9NPRUGB6/Rk4ELds4LIvh/EQwY5MS0I9ev
         b7SDj1nPT7t8l+ju8gN06xwKglzOWLKNjzayamP7YKiFecXoqpdc2IXfrXtTetKLut2P
         X4XMSCDMSJsJyyK79EcihrkJ72sX876INboYfZffgf/ifTdw8d6lojoMj59afF41qw6Y
         OCU7ss7c9Fy6k94UN0ZkmHxn0SS99/y8PXUw95nia6nRF2bXvJDa99xOnvQ5fh9wt2Ac
         3JwnN0E1TI8mQxBO4TxOX+xaeTFb19sif76TkLW1YXkffT1prP+p93KS1+zoFEsW7Egg
         QOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772849635; x=1773454435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bflwm+ROR9ydzw/4i2++zpxF9XuMNHN2OSHTS/RCBk=;
        b=coSSMMb7TsD309TCeu5Qzrii4n/oh/+RQ0UFGjC0an5dhgSaPSsFyb1Zfmd3zLRI5S
         PF5Tjgr1+ZhQLWqYRBKScvZCFpsLO6Ks1KusXKmJ3zDLa50Gv/S+xxEGozhDv3HSARtH
         EEW0vmRyhskwGg1mDJqVjalD9IBQOoTuDqZscZq7SgPArWsm2Gk0Ya0HWInKohNpdn44
         FJrMFkJYiR2R7VngDCF54atMUy+k1qZCwj0kOg2vx0Nsnsj/8ZKvZILE8u+OB3WZMphh
         xXmjDg6SGVaesAGq6op3llzuxS7+0LhAAOelIO4mhoxoic75E9dp2GWSB9ILqybE8vap
         HuZw==
X-Gm-Message-State: AOJu0YwYSmJWZjKPHJx3nX0ondjHFcBi+aSDI0odVpA3PN6y4zXmgIeb
	fQD9suopDng8f8AXyE5dBgOW1dR1599KUa1lRLu+539tgKyvUteHFmpDE0W81mXE
X-Gm-Gg: ATEYQzyb+KFnrx+DKUFm1slbmC84rZ2nDDQ/qN/gWse2MLeA3HN+iaXm/URye81uVBg
	+DKfFwJhEcu27mANJHgczyod6n9/SI3pAdYE4Rf8790sxndKNGYOKMAdTT0tH2wcCxzUilqJzXU
	+pHFoKSE9ws5pTP8zSFmRNAda6vIxl6gwersbXPR3BzJ6svbNtcbEn83QLCIGE9M9stwO2/vBOp
	gJkRuaVMXzCIB9L8G5+SHQfgAyfQxrn7+G3YYiQBlFV5XoNB/63gLc/1lh2eJ41tdyiqA+sDIcU
	a1/EzLy3ljyJToLF7eccsbcHzMUpq6vHVeKX7rrFTnDLkAjdY2OApaC2JTN40nPPgn512Sq7nb+
	H3WR31g/M/5YHiooy4Bx89L6xT9GicID6FkY2mLG27mV43D/dFayeR2boWT3ddZak31ylIbxRll
	DVJP3c9KnycdP5dMT8dPHGPVFnvL+BzlHyQPXugbGv
X-Received: by 2002:a17:903:2c04:b0:2ae:3fb9:2690 with SMTP id d9443c01a7336-2ae82393b04mr42445135ad.19.1772849635255;
        Fri, 06 Mar 2026 18:13:55 -0800 (PST)
Received: from rigel (121-44-73-195.tpgi.com.au. [121.44.73.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f742a5sm33202505ad.54.2026.03.06.18.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 18:13:54 -0800 (PST)
Date: Sat, 7 Mar 2026 10:13:44 +0800
From: Kent Gibson <warthog618@gmail.com>
To: joussemetmathis@gmail.com
Cc: linux-gpio@vger.kernel.org
Subject: Re: Help regarding IO configuration of multiple lines
Message-ID: <20260307021344.GA14011@rigel>
References: <cf52e066ba190f52bbfbfcfdcbdf7addc8998616.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf52e066ba190f52bbfbfcfdcbdf7addc8998616.camel@gmail.com>
X-Rspamd-Queue-Id: 81CF222996E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32706-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[warthog618@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.909];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 12:09:50PM +0100, joussemetmathis@gmail.com wrote:
> Hello,
> 
> I am trying to learn how to use libgpiod on a Pi 5. I created for that
> goal a simple circuit with a push button and 2 LEDs, one of which turns
> on on a button press.
> Since I want to keep my program as modular as possible, I created a
> pinconfig function that configures the pins according to the parameters
> passed in main.
> However, when trying to pass an enum array of gpiod_line_direction to
> the function, the code no longer works and the LEDs no longer turn on.
> I suspect it is due to the way the array is handled, but since this use
> case isn't shown in the examples and that online ressources seems to
> only talk about v1 of gpiod, I'm a bit stuck.
> Could someone help me? You'll find my code attached in a zip in this
> email.
> 

Yeah, the example code doesn't provide a good example of requesting
lines with different settings.
The closest is get_multiple_line_values.c.  Though that applies settings for
each line individually when it could just use a single
gpiod_line_config_add_line_settings() call, as all the lines have the
same settings.  Not sure why.  ¯\_(ツ)_/¯

The relevant section of your code, which seems to follow that example, is:

	gpiod_line_settings_set_direction(line_settings, *direction);
    // ...
	for (int i = 0; i < line_nbr; i++) {
		gpiod_line_config_add_line_settings(line_config, &pin_list[i], 1, line_settings);	
	}


That applies the first entry in your direction array as the direction for all
lines. Definitely not what you want.

See if this works for you:

	for (int i = 0; i < line_nbr; i++) {
	    gpiod_line_settings_set_direction(line_settings, direction[i]);
		gpiod_line_config_add_line_settings(line_config, &pin_list[i], 1, line_settings);	
	}

That applies the direction for each line individually, with other line
settings being the same.

Cheers,
Kent.

