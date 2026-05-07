Return-Path: <linux-gpio+bounces-36396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIZDFpHI/Gn1TgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:14:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D53764ECC33
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 19:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 112513060330
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 17:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E956D34F49F;
	Thu,  7 May 2026 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H7brl1ks"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A482D29C7
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 17:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173958; cv=none; b=nQ8xVEX4tXUHxchdVYr4dubwflYbsYx5kdSPjSFA+fgJDfYhfrlIBrGXLf0wOf4s8oIWgivOqhqmP0QUjRPfo3x3WyqWVZ6sf4xZrbxXko9MJ09beOqdTZWyl1RKm61ePdk4n+rM+DKcXApLrqFzZ0+bxeeQiVVvxqRtT9W93E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173958; c=relaxed/simple;
	bh=tvdeLUFLCStPowherdWKZjQ1YY1SECViAIYm5uIMYOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COhQn/gy4iZkg8rB6Bt8WWm4PFaP3fEtf3Hz0r7k4bvl87s69ww52oJM7D+rX8LfYGtoKURETt2YVpOCuIJIO/3spnmze0G++MYnpldjR6SyNmI15PXMeTL0JAmlYapCWFIlQX5OeDfCglElixOThEdM+YPrw/PXlVWsKTkCqsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H7brl1ks; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so735053b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778173956; x=1778778756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03ETEGQ8LUzEYKaAYfcXw2hfuEQY5oNdSkw/PzgTOLE=;
        b=H7brl1ks2P73BqGF8p27A/GyV5jRZHDQjUayjJ35RIddl1fXinl5nsUI9k3HE7l9It
         iR2OHsIWFOFiZ9IqBm6NdE1Yfu4sODKWjz3o6kTBI+SDOWpDthguSFCGy+oGcuwkdHTK
         i4afooxJ+7Ef14/DkOq9DTIChKYCSB6Gei/USQLt6U+gf/2CUhsIkn9tmxoxbNYlRuGB
         B+DKJJGi8NjWaNU6Y4wGFSPI6IdI3WD4cyVvkU0r/FJC9OsdKUQREIF9NlTMjnrVVTz+
         aIQlVdhZ58Utu6PsIXhKza0/Y1Y1yACHtt6a0DGPc6DfG2mR20mMfvCUvl3gCC/v9neL
         fMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173956; x=1778778756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03ETEGQ8LUzEYKaAYfcXw2hfuEQY5oNdSkw/PzgTOLE=;
        b=Xu2axc++AGI3YtJIeB2aTPMokhNs+zebUWmy/q7y7xEKsuwBJF6VM2ir/uF8S+FpYK
         2wdzver6yWQO+/YcrMsNa6tsDQYM6oz6js6aKzlchFrXwjDez0XgCMukWILgtNxbsdY3
         7+0/JNGPfJDU6JMUBPCF5e84nrw9imuPeLyMOl0LTw99JPyQjwJqJYUCVBAE+lwVySmg
         MiPDb4B9WFPraZWie4JvNmMb87L9Jz0rU6o2qdNKF8pJnwbU3bSzJkvl2QVpVp72RCnQ
         RK/OTp8k7yl7iXscjuHeFBxdp7H2KKFxZbtKXt5FQeMo1N+XDEwgWfCy25fFBv9Nx4Xx
         Aytg==
X-Forwarded-Encrypted: i=1; AFNElJ+zU965PjlKL2CueKADT5a2FsgEsgc4Bjfs45RpYBGJ9nVSIGQNvALQiwTYXgatrqV4PG9BdRXrJB5M@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqjbxalsWCgnAydWvF6FUEuGbVR1TrJsFubylMRgwNbHD1U3V
	Pf9XeaLjLlGWNeK77OCUG4ImV8gqlH/vHfmQCeaBe8uYe0Ftjb7sUkOLsb9mkNKZ8j8=
X-Gm-Gg: AeBDievArBUFYrj7x4OKF9Q6cZHSrMd+tdZ1WNwsX6yVifT5kqieu6trETS4mx/wzUb
	DTYPOH0JArcAQrHEILmYGP0tDp+bE8O1Zw5jcMm/VKK8h1QN1bZA2MJCTIakbpXCF5pTlbFdwLe
	+b8jKP8oHFGyvWYAjQOzo/079ksRr4pImMYxKtSkhgQQ2MGYyjwp4zye8zYmgdh21qWNzhIyj74
	m94aaqcdBoce3C0o7YfI7yNcMHnYso6bIDcij/0c8QC2j5sk5MP1T9Xi8RVNSLLpBMuYN//dP9i
	kkCNjfApxndyaZiSSuKjGmX8HSWHJNkC6jzzQ+QKoUdG3sBBus2LYqTtgqfBJzvJRVIzLuvZdG8
	7bTe288llSi7r6sCVBeJo4AYHjYfhj4FYqTUk3QBu3mBOul0ULlRc68tAm9dS0X5W0K42lhDgAw
	TbuUXqE+7UXlqgX2lv5PmvCe8uMWaXuizqjT501Q==
X-Received: by 2002:a05:6a00:4517:b0:827:3d52:5d1a with SMTP id d2e1a72fcca58-83a58a2afc1mr7788068b3a.0.1778173956119;
        Thu, 07 May 2026 10:12:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6605:e5cd:f9b9:d6c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm11874096b3a.30.2026.05.07.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:12:35 -0700 (PDT)
Date: Thu, 7 May 2026 11:12:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Beleswar Prasad Padhi <b-padhi@ti.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <afzIABSh1xtMEGbf@p14s>
References: <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <268f8e00-91bc-43ea-ba95-077cf859e7f3@ti.com>
 <9e2492d3-8753-46c7-8db6-5f1a80b4f2e9@foss.st.com>
 <db4c18be-1c8d-4227-9fcc-1d25cec50e37@ti.com>
 <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6917e3d7-8c6c-4e63-8eca-5308621ec3e8@foss.st.com>
X-Rspamd-Queue-Id: D53764ECC33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,lunn.ch,kernel.org,lwn.net,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	TAGGED_FROM(0.00)[bounces-36396-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.32:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,0.0.0.35:email,0.0.0.25:email]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 10:46:11AM +0200, Arnaud POULIQUEN wrote:
> Hi Beleswar
> 
> On 5/5/26 07:25, Beleswar Prasad Padhi wrote:
> > Hi Arnaud,
> > 
> > On 04/05/26 22:34, Arnaud POULIQUEN wrote:
> > > Hi Beleswar,
> > > 
> > > On 5/4/26 10:17, Beleswar Prasad Padhi wrote:
> > > 
> > 
> > [...]
> > 
> > > > 
> > > > > 
> > > > > I may have misunderstood your solution. Could you please help me
> > > > > understand your proposal by explaining how you would handle three
> > > > > GPIO ports defined in the DT, considering that the endpoint
> > > > > addresses on the Linux side can be random?
> > > > > If I assume there is a unique endpoint on the remote side,
> > > > > I do not understand how you can match, on the firmware side,
> > > > > the Linux endpoint address to the GPIO port.
> > > > 
> > > > 
> > > > Sure, let me take an example:
> > > > Assumptions: 3 GPIO ports in DT, 3 endpoints in Linux (one per port),
> > > > 1 endpoint in remote (0xd) and 1 rpmsg channel (rpmsg-io)
> > > > 
> > > >          rpmsg {
> > > >            rpmsg-io {
> > > >              #address-cells = <1>;
> > > >              #size-cells = <0>;
> > > > 
> > > >              gpio@25 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <25>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > > 
> > > >              gpio@32 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <32>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > > 
> > > >              gpio@35 {
> > > >                compatible = "rpmsg-gpio";
> > > >                reg = <35>;
> > > >                gpio-controller;
> > > >                #gpio-cells = <2>;
> > > >                #interrupt-cells = <2>;
> > > >                interrupt-controller;
> > > >              };
> > > >            };
> > > >          };
> > > > 
> > > > Code Flow:
> > > > 1. "rpmsg-io" channel is announced from remote firmware with unique dst
> > > >       ept = 0xd.
> > > > 
> > > > 2. rpmsg_core.c creates the default dynamic local ept for the channel
> > > >       ept = 0x405.
> > > > 
> > > > 3. rpmsg_core.c assigns the allocated addr to rpdev device:
> > > >       rpdev->src = 0x405 and rpdev->dst = 0xd.
> > > > 
> > > > 4. rpmsg_gpio_channel_probe() is triggered. For *each* of the GPIO ports
> > > >       in DT, it will trigger rpmsg_gpiochip_register() which will now:
> > > >          a. Call port->ept = rpmsg_create_ept(rpdev,
> > > >                                                                      rpmsg_gpio_channel_callback,
> > > >                                                                      port,
> > > >                                                                     {rpdev.id.name,
> > > >                                                                      RPMSG_ADDR_ANY,
> > > >                                                                      RPMSG_ADDR_ANY});
> > > >              Ex- port->ept->addr = 0x408
> > > > 
> > > >          b. Prepare a 8-byte message having 2 fields:
> > > >              port->ept->addr (0x408) and port->idx (25)
> > > > 
> > > >          c. Send this message to remote firmware on default channel ept
> > > >              (0x405 -> 0xd) by:
> > > >              rpmsg_send(rpdev->ept, &message, sizeof(message));
> > > > 
> > > >          d. Remote side receives this message and creates a map of the
> > > >              linux_ept_addr to gpio_port. (0x408 <-> 25)
> > > > 
> > > > 5. After this point, any gpio messages sent from Linux from gpio port
> > > >       endpoints (Ex- 0x408) can be decoded at remote side by looking up
> > > >       its map (Ex- map[0x408] = 25).
> > > > 
> > > > 6. Any messages sent from remote to Linux for a particular gpio port can
> > > >       also be decoded at Linux by simply fetching the priv pointer to get
> > > >       the per-port device:
> > > >       struct rpmsg_gpio_port *port = priv;
> > > > 
> > > 
> > > Thanks for the details!
> > > 
> > > To sum up:
> > > - the default endpoint acts as the GPIO controller (0x405),
> > > - one extra Linux endpoint is created per port defined in DT.
> > > 
> > > This should work, but my concerns remain the same:
> > > 
> > >    1) This implementation forces the remote processor to handle a single
> > >       endpoint instead of one endpoint per port. This may add complexity to
> > >       the remote firmware if each port is managed in a separate thread.
> > 
> > 
> > A. Not really, I just chose 1 remote endpoint for this example as you
> >      suggested to. We can scale it for two-way communication via the
> >      get_config message like you suggested below.
> > 
> > B. Isn't it a bad design of the firmware if it is handling 10 gpio ports
> >      in 10 threads? The logic to handle all the ports is the same, only
> >      the parameters (e.g. line number, msg) is different.
> > 
> > > 
> > >    2) Linux, as a consumer, should not expose its capabilities to the remote
> > >       side (in your proposal it enumerates the ports defined in the DT).     In my view, the remote processor should expose its capabilities as the
> > >       provider.
> > 
> > 
> > Agreed on this.
> > 
> > > 
> > >  From my perspective, based on your proposal:
> > >   1) Linux should send a get_config message to the remote proc (0x405 -> 0xD). 2) The remote processor would respond with the list of ports, associated
> > >      with an remote endpoint addresses.
> > 
> > 
> > Agreed, we can scale it for multiple remote endpoints like this.
> > 
> > >   3) Linux would parse the response, compare it with the DT, enable the GPIO
> > >      ports accordingly, creating it local endpoint and associating it with
> > >      the remote endpoint.
> > > Using name service to identify the ports should avoid step 1 & 2 ...
> > 
> > 
> > Yes, but won't that make a lot of hard-codings in the driver?
> > 
> > +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> > +    { .name = "rpmsg-io-25" },
> > +    { .name = "rpmsg-io-32" },
> > +    { .name = "rpmsg-io-35" },
> > +    { },
> > +};
> > 
> > What if tomorrow another vendor decides to add more remoteproc
> > controlled GPIO ports to Linux, they would have to update this struct in
> > the driver everytime. And the port indexes (25/32/35) could also differ
> > between vendors. We should make the driver dynamic i.e. vendor
> > agnostic.
> > 
> > I think querying the remote firmware at runtime (step 1 & 2 above) is a
> > common design pattern and makes the driver vendor agnostic. But feel
> > free to correct me.
> > 
> 
> You are right. My proposal would require a patch in rpmsg-core. The idea of
> allowing a postfix in the compatible string has been discussed before, but,
> if I remember correctly, it was not concluded.
>

I also remember discussing this.  I even reviewed one of Arnaud's patch
and submitted one myself.  This must have been in 2020 and the reason why it
wasn't merged has escaped my memory.
 
> /* rpmsg devices and drivers are matched using the service name */
> static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
> 				  const struct rpmsg_device_id *id)
> {
> 	size_t len;
> 
> +	len = strnlen(id->name, RPMSG_NAME_SIZE);
> +	if (len && id->name[len - 1] == '*')
> +		return !strncmp(id->name, rpdev->id.name, len - 1);
> 
> 	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
> }
> 
> Then, in rpmsg-gpio, and possibly in other drivers such as rpmsg-tty and
> a future rpmsg-i2c, we could use:
> static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
>     { .name = "rpmsg-io" },
>     { .name = "rpmsg-io-*" },
>     { },
> };

That was my initial approach.  We don't even need an additional "rpmsg-io-*" in
rpmsg_gpio_channel_id_table[].  All we need is:

/* rpmsg devices and drivers are matched using the service name */
static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
                                 const struct rpmsg_device_id *id)
{
 +     size_t len = strnlen(id->name, RPMSG_NAME_SIZE);

 -     return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0; 
 +     return strncmp(id->name, rpdev->id.name, len) == 0;
}

And let the rpmsg-virtio-gpio driver parse @rpdev->id.name to match with a
GPIO controller in the DT.

> 
> If exact name matching is strongly required, then this proposal would not be
> suitablea.
> 
> A third option would be a combination of both approaches: instantiate the
> device using the same name service from the remote side, as done in
> rpmsg-tty. In that case, a get_config message, or a similar mechanism, would
> also be needed to retrieve the port information from the remote side.
>

I'm not overly fond of a get_config message because it is one more thing we
have to define and maintain. 

Arnaud: is there a get_config message already defined for rpmsg_tty?

Beleswar: Can you provide a link to a virtio device that would use a get_config
message?
 
> Tanmaya also proposed another alternative based on reserved addresses.
> 
> At this point, I suggest letting Mathieu review the discussion and recommend
> the most suitable approach.
> 
> Thanks,
> Arnaud
> 
> > > 
> > > At the end, whatever solution is implemented, my main concern is that the
> > > Linux driver design should, if possible, avoid adding unnecessary complexity
> > > or limitations on the remote side (for instance in openAMP project).
> > 
> > 
> > Yes definitely, I want the same. Feel free to let me know if this does
> > not suit with the OpenAMP project.
> > 
> > Thanks,
> > Beleswar
> > 
> > > 
> > > Thanks,
> > > Arnaud
> > > 
> > > 
> > > > So Linux does not need to send the port idx everytime while sending a
> > > > gpio message anymore.
> > > > 
> > > > Thanks,
> > > > Beleswar
> > > > 
> > > > [...]
> > > > 
> > > 
> 

