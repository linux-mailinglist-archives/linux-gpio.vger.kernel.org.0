Return-Path: <linux-gpio+bounces-34482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDqOF27Ly2llLwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:26:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361636A3C2
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 15:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6446300E4AA
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04A62F3C19;
	Tue, 31 Mar 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rei7yq5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B85D40DFB9
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963411; cv=pass; b=AwTGmEGr9GYl/cVqB6S2J8Plg22PmNOGsyu6zWYASWisnTaWi5XbBoIn1cLWW05YG19aGr779F5vOi70Rme67QjaLoh5V5k4IBPVc6ABVadCsmyOouC8tekwaEQZzadeIAlS5LD69arKdDfoNEwuQKvG5wuiDHVgBDNk/8CDfGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963411; c=relaxed/simple;
	bh=s2Uo0KjdPA4z97Dyow3Aluyz4DAChcUs8D0uPsPLUMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPoQSDmfQ8AIv3G+QUFmu3mf1y6ETvQFaSb5WkLjeyrWWcbrOz2KKO4N44Muwr/nKUaTovARj90qyD5YcPuKXaOify7ywaAnuPiCtUDZaIM4weh1GKKOdhLUEj/bduVhMqnsVOrPvQzo1orUlFwX1ZcbRUtf3u+JQjCE94jCEIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rei7yq5e; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so2070677a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 06:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774963409; cv=none;
        d=google.com; s=arc-20240605;
        b=dmpooVizqrD6T6tdiR6mQUPgpBuivrSlrHSZoH5zr5GsdpYUKetYY0ibLpu9WxL/3y
         KHFWem5/9fHRaWEVPkMmDPTbF2ya+EaRDvt1Wxq/UzEVCh0jmLxVpESPcRbKnmLLGmOe
         nxGvxlNjcTRNNPwhuUHPfsZi2ETxT0iiyCk3IlGgqpiL93fcms/9Fy2GbNPsdriR6TTc
         Tz91O92XhfcASIZvxIJ82mMG1YESuD0UsSuYH+pSX8VTargqMlxMOQRdb7EHySEj0OLA
         2BeLQYjQNLXbMFTcUX5avbGkyJjHKKYJldKcNR0slT6G+TBR3Yc4e+HvGEJjkkwRrjUb
         /drQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u6xV2lobPDolQgM4d4gNnCUj1tl/ZlRnVZMlO8/XGv8=;
        fh=fLNQehOz3kzO71ndu1RTkkj70W/G+zXvSRnnOsw48+I=;
        b=eLMq7PswWVtWPYgvNR4vxuLr5dA/41bSaHR5Ltf/3WqBnqnztszVIDSuEO2P+oSKpt
         ROxEK7fHnD2wtPsb9WJMR16tVIhRXI2kxIz7PLkJu/XLanfCQiNlf/QvcS5sZ7YRLhhS
         KcerzSRY+oQLOGHaKw3eUi9EjNiCVH49xhoCyCBkTCs3RfepsSAbOzLWK9IfTrgjRt7l
         LhDv191AVwOQdqXZfBoJ0iHFjhX3ETJJLFK7zKDfBtgoJFauEmSem4d7VrkkqPpOoksA
         N0JHzsMR2ia3uAXdrFeupp7yNPfUtLQUIeZVrSLschnaCmdoJiBs62TXu/M+l424Tw/0
         j5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774963409; x=1775568209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u6xV2lobPDolQgM4d4gNnCUj1tl/ZlRnVZMlO8/XGv8=;
        b=rei7yq5enphVDTFDqo/9Ep/d4J71a/A9HGrF2A+NPm8k0490UjQwribemMHZU1YsYz
         9RODQgGFSzcxCfq2MqLViJag3KsEwK3PKNTo1nlFrpYwJBoUMb0yfZmKWGFQXhbIdGnd
         q5w1Wb1CH7HZ+5mnHbNnEVpXsyZLNtiKRdH61M2G29UOywD2HZND+FzkA6+TnPborion
         v1/JZcxRGqPQ9QzfIDkJL5MuiWtCCbRRpn1cGZSqF+rJnv01VmHc2TbQ4kFPWTzgAzMG
         YcZpvmENUf/VfwFHY+IEXB455BSkeEQNe7+JDtcH1X7mQS4PwIosNYVYhA7lRzHOk98z
         vKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963409; x=1775568209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6xV2lobPDolQgM4d4gNnCUj1tl/ZlRnVZMlO8/XGv8=;
        b=sq86QuT8DmBVfq7bfPlmEgzwW8cz8CtIf+2XV+SZNVoY2Fyjq0DEcvZo4bp4F4FNKR
         Pcqhl46n81cjCF7jKBU4HP7q3JzMCRtxJV2q+X4DXUK0Oq59HYrebKWTI4+8sjwAd4dl
         UThy6XqLrsJGBTfAxBxDUZcz75alQdE+Wlo2UCZ35W9XalZRQZ8SeHDnHSl08pieHllW
         MoujLhNU//dGhScgHaa9j6IQW8J4LvonpnDAGhK3G739RS3xwzhZc8nokGQaxkF67sGO
         L+PJG8m+Mc+SR+09BPbXuxCcYq4Fl+2W9M4TFg1DhfiyJ8kxH2XIrCFc4CZQZaWxT06P
         ysDQ==
X-Gm-Message-State: AOJu0YyA6x6iSNPUZT9HSOlDqLKA6cwUKZqViJSvH+JnaUgL17QRsJ9c
	66pg3BHTvxDuwqZitJV3+f3Uw7gqsrxUWDV7ephnNVvWouKELm9QrL/TGYid+zNbsa/Ycaj/oTV
	1dhaTYgshNfxHdUTyLnHc1I9qF9aOzNZdpQWa4to=
X-Gm-Gg: ATEYQzyVzeXfHS3rmfLufCkwPet2fhjnHFedglAA5GbvsvTCCAVf3nmutmOtE0ai00b
	FhHfZIDN81VYVHp3DAUrcfl+Q5f2rv+YMNwRQHRR/2RS6WU+rWGx5sxm/ytdzprEnoOfb6a0Qdl
	sskszslPowrMQ2m6hwohkP4feilAgWkbVZyyrU0RnEzxsoVfz7/1Pje6nmMGC3R1ymILp3bRhdi
	0uTGGTgvqIwWxIqFljusQVgL/izj8eCoWJKGdl6hqSVy8hD42zfVUOuJsudJjPFp5ZOA0Z+LG29
	Lfy1WQ==
X-Received: by 2002:a05:6a20:244d:b0:38b:ecae:671b with SMTP id
 adf61e73a8af0-39c871a9b68mr17056297637.0.1774963409219; Tue, 31 Mar 2026
 06:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cf52e066ba190f52bbfbfcfdcbdf7addc8998616.camel@gmail.com> <20260307021344.GA14011@rigel>
In-Reply-To: <20260307021344.GA14011@rigel>
From: Mathis Joussemet <joussemetmathis@gmail.com>
Date: Tue, 31 Mar 2026 15:23:16 +0200
X-Gm-Features: AQROBzBNCS1sWV_lo0Ti5Ack1vHz4q7sJjppI_CQM3UZhwewHGjKqr0Ma1TKeHQ
Message-ID: <CAOdiGsteopFY2-A9X65cBxMKbW9uWeZvfaKbMhwFT1E5gceOLQ@mail.gmail.com>
Subject: Re: Help regarding IO configuration of multiple lines
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007f0d79064e51dfc2"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34482-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joussemetmathis@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5361636A3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000007f0d79064e51dfc2
Content-Type: multipart/alternative; boundary="0000000000007f0d78064e51dfc0"

--0000000000007f0d78064e51dfc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kent,

Sorry for the late reply, was up until now in exam hell.
It indeed works! I can now drive 2 LEDs at the same time!

I just have 2 new questions:
- I am now using a button to toggle one of the two LEDs by checking the
buttons value using
gpiod_line_request_get_value(request, offset[2])!=3D0)
in a if statement. I've setup the correct input bias, but when I press on
it, the LED doesn't toggle. Checking with a scope still shows the voltage
jumping to 3.3v when pressed and 0v at other times. Is there something I'm
missing?
- I'm trying to switch from an snapshot based line change reporting to an
event one. however when using a watch line event before/after the request,
the program still blocks. How should i code it to prevent blocking while
still having infos like output values types when there is a change?

Thanks for the help and sorry again for the late reply
Mathis

Le sam. 7 mars 2026 =C3=A0 03:13, Kent Gibson <warthog618@gmail.com> a =C3=
=A9crit :

> On Fri, Mar 06, 2026 at 12:09:50PM +0100, joussemetmathis@gmail.com wrote=
:
> > Hello,
> >
> > I am trying to learn how to use libgpiod on a Pi 5. I created for that
> > goal a simple circuit with a push button and 2 LEDs, one of which turns
> > on on a button press.
> > Since I want to keep my program as modular as possible, I created a
> > pinconfig function that configures the pins according to the parameters
> > passed in main.
> > However, when trying to pass an enum array of gpiod_line_direction to
> > the function, the code no longer works and the LEDs no longer turn on.
> > I suspect it is due to the way the array is handled, but since this use
> > case isn't shown in the examples and that online ressources seems to
> > only talk about v1 of gpiod, I'm a bit stuck.
> > Could someone help me? You'll find my code attached in a zip in this
> > email.
> >
>
> Yeah, the example code doesn't provide a good example of requesting
> lines with different settings.
> The closest is get_multiple_line_values.c.  Though that applies settings
> for
> each line individually when it could just use a single
> gpiod_line_config_add_line_settings() call, as all the lines have the
> same settings.  Not sure why.  =C2=AF\_(=E3=83=84)_/=C2=AF
>
> The relevant section of your code, which seems to follow that example, is=
:
>
>         gpiod_line_settings_set_direction(line_settings, *direction);
>     // ...
>         for (int i =3D 0; i < line_nbr; i++) {
>                 gpiod_line_config_add_line_settings(line_config,
> &pin_list[i], 1, line_settings);
>         }
>
>
> That applies the first entry in your direction array as the direction for
> all
> lines. Definitely not what you want.
>
> See if this works for you:
>
>         for (int i =3D 0; i < line_nbr; i++) {
>             gpiod_line_settings_set_direction(line_settings, direction[i]=
);
>                 gpiod_line_config_add_line_settings(line_config,
> &pin_list[i], 1, line_settings);
>         }
>
> That applies the direction for each line individually, with other line
> settings being the same.
>
> Cheers,
> Kent.
>

--0000000000007f0d78064e51dfc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Kent,</div><div><br></div><div>So=
rry for the late reply, was up until now in exam hell.<br></div><div>It ind=
eed works! I can now drive 2 LEDs at the same time!<br></div><div><br></div=
><div>I just have 2 new questions:</div><div>- I am now using a button to t=
oggle one of the two LEDs by checking the buttons value using=C2=A0<div sty=
le=3D"color:rgb(171,178,191);background-color:rgb(40,44,52);font-family:&qu=
ot;Droid Sans Mono&quot;,monospace;font-weight:normal;font-size:14px;line-h=
eight:19px;white-space:pre"><div><span style=3D"color:rgb(152,195,121)">gpi=
od_line_request_get_value</span><span style=3D"color:rgb(171,178,191)">(req=
uest, offset[</span><span style=3D"color:rgb(198,120,221)">2</span><span st=
yle=3D"color:rgb(171,178,191)">])</span><span style=3D"color:rgb(224,108,11=
7)">!=3D</span><span style=3D"color:rgb(198,120,221)">0</span><span style=
=3D"color:rgb(171,178,191)">) </span></div></div></div></div><div>in a if s=
tatement. I&#39;ve setup the correct input bias, but when I press on it, th=
e LED doesn&#39;t toggle. Checking with a scope still shows the voltage jum=
ping to 3.3v when pressed and 0v at other times. Is there something I&#39;m=
 missing?</div><div>- I&#39;m trying to switch from an snapshot based line =
change reporting to an event one. however when using a watch line event bef=
ore/after the request, the program still blocks. How should i code it to pr=
event blocking while still having infos like output values types when there=
 is a change?<br><br></div><div>Thanks for the help and sorry again for the=
 late reply<br></div><div>Mathis</div><div><br></div><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sa=
m. 7 mars 2026 =C3=A0=C2=A003:13, Kent Gibson &lt;<a href=3D"mailto:warthog=
618@gmail.com">warthog618@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Mar 06, 2026 at 12:=
09:50PM +0100, <a href=3D"mailto:joussemetmathis@gmail.com" target=3D"_blan=
k">joussemetmathis@gmail.com</a> wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am trying to learn how to use libgpiod on a Pi 5. I created for that=
<br>
&gt; goal a simple circuit with a push button and 2 LEDs, one of which turn=
s<br>
&gt; on on a button press.<br>
&gt; Since I want to keep my program as modular as possible, I created a<br=
>
&gt; pinconfig function that configures the pins according to the parameter=
s<br>
&gt; passed in main.<br>
&gt; However, when trying to pass an enum array of gpiod_line_direction to<=
br>
&gt; the function, the code no longer works and the LEDs no longer turn on.=
<br>
&gt; I suspect it is due to the way the array is handled, but since this us=
e<br>
&gt; case isn&#39;t shown in the examples and that online ressources seems =
to<br>
&gt; only talk about v1 of gpiod, I&#39;m a bit stuck.<br>
&gt; Could someone help me? You&#39;ll find my code attached in a zip in th=
is<br>
&gt; email.<br>
&gt; <br>
<br>
Yeah, the example code doesn&#39;t provide a good example of requesting<br>
lines with different settings.<br>
The closest is get_multiple_line_values.c.=C2=A0 Though that applies settin=
gs for<br>
each line individually when it could just use a single<br>
gpiod_line_config_add_line_settings() call, as all the lines have the<br>
same settings.=C2=A0 Not sure why.=C2=A0 =C2=AF\_(=E3=83=84)_/=C2=AF<br>
<br>
The relevant section of your code, which seems to follow that example, is:<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_line_settings_set_direction(line_settings=
, *direction);<br>
=C2=A0 =C2=A0 // ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; line_nbr; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_line_config_a=
dd_line_settings(line_config, &amp;pin_list[i], 1, line_settings);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
That applies the first entry in your direction array as the direction for a=
ll<br>
lines. Definitely not what you want.<br>
<br>
See if this works for you:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; line_nbr; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_line_settings_set_direction=
(line_settings, direction[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_line_config_a=
dd_line_settings(line_config, &amp;pin_list[i], 1, line_settings);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
That applies the direction for each line individually, with other line<br>
settings being the same.<br>
<br>
Cheers,<br>
Kent.<br>
</blockquote></div></div>

--0000000000007f0d78064e51dfc0--
--0000000000007f0d79064e51dfc2
Content-Type: application/zip; name="pinconfig.zip"
Content-Disposition: attachment; filename="pinconfig.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mnen1ncc0>
X-Attachment-Id: f_mnen1ncc0

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
gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwJ8WQkG3fKHR
LSXKH5FL5eepXE/lF+nNLCq/1eyWbVQ+et61bKdyDS3n0fI4rZ/vqX/vgpPC8ju0PY11tKqkgBdp
fR2VT1E5QOW5tGzxjFeh5WnHbV9m/aU3c6hcTctW5q+ulL+1trTfx2lZ62n/nOOOh6leoPJVVNGh
MovzGSqfoo7zVFbh/wcnzksXrQ/N/mB+ztT/aZSF8dKV09fbe13oqo3GsBmzQt0rwleHl3d1r/4Q
vYVlhSXmzudVdLvZPlF39T+vMP1Hmlz+3srqVP8ujemz6fqJj//PKLilJKLcYCoAC4Bu6ko9U2q0
Z2SARtwE6iutPYSqHpQBFLV6hwxQt9nV+j5SQbVXAVCkmloJQJGrv0ekqgCRtBdkgKCqmZYN8heB
6M2WAOrwPvAZCUD7JACslY4BQFOrBHBAfQm7on5Ewt1R9yDq7ZIBqrHNfmkG627HnaM+jEFQc9gH
CMQlqpKQghKAKsuo8qaCKguxXbVbBlDVKRkjIU+5Y+qXAWq2otLXlaoItogXkFdIAFX/gZef42G3
VAE4K90pAeB/aZgpSkmivVoCkEdRuwNd3Y13s3AuH8CKp5SqvygYYN+gdhUApBQc+FPMi0TuPoLh
lzEWtbsB4Eai80pB5xWmI71GGt6Kl2ls7mkJoPZnCsDTMprgKUd0SLyg9jcA8ACpaZNZzY8Ly1Ne
pVQtk9lwZr8iA8j3V62T6VChJoxzmVBm3SyzIczKSgB/PgerRwpk/VwZ4DFlIY60fosE0K20o8v6
92SAPfICbLb5dey+Mh8D6V170iMZXKffkgGWfRb7NbVZ+7kEsAlpeSqq/YMMcAdZe1M/OqBhVP9s
D662qe8c0H4jA3zxs6TuiQPaXTLAkf2k7vAB7fsA8PKniPTQgerLsZEW7Lo8ta36y/h0WfgakdLV
zQpA9fwkkcaqX8bBL7iTSLuqn8VIdkSIdOucX9LO76ebpsUEKRT4JOn2fgAZuynj6pUx0DKZB5wq
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
AA4AHwUAADVDAAAAAA==
--0000000000007f0d79064e51dfc2--

