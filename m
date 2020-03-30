Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EFB19832A
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2020 20:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgC3SQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Mar 2020 14:16:21 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42051 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgC3SQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Mar 2020 14:16:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id z5so18872056oth.9;
        Mon, 30 Mar 2020 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=hc3WCyyOJyVb1bVm2+erTwMdDqb8JOvqNVevK3r7VwI=;
        b=ai6wI+ycqrkzpl/S2YJzZdSui/OqHxW+zs9NCXGh7U6Ao8RzV+b6ZH92pP+mJSeMDg
         3zFsBbaW5dHtjdptA2ZKynOAnrY/IFF/rbTO3di295t+BhXrNfSP1TZfcKFLzaaoOfUV
         bVKuFgdn0MvaqJSHswPZS+XldoySduiB80LONN0NvR4dSXufP5iF9jGiXSGWYDD9cBxG
         xAJILj6xA/q3qaZGqm/kdv34TUUojc70Ogmsn38uo995wLI4LwNDS5srJoxLtqNTnQ0w
         U9IlzFhfaJqL2AEjBt3teQ6hoVJOurZOyN+6s5i5g5RZL39LrAlRA3Usk0jJOm4IPLXJ
         aPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=hc3WCyyOJyVb1bVm2+erTwMdDqb8JOvqNVevK3r7VwI=;
        b=EdvLemNxXnJ1LftsQOzPMFhujmuITyTJPbPfpiajmjYWdrJ7hZosla/6BYRmaZvKRz
         6QWDBemcsgxjzgvkAmCrWE6GXun1MQ0HKsP+Z2x/Z9+bYwFFoIrGWa8O8TDBUbf70+xN
         +Id8faID04DU50Vmfh/NlcxEhGtE9sPtABREMOiCZrLouR3XVtt3/6MU4pGfuMQKbcFN
         nR+zRQEbMMO2VEBavxrElyYVy4D0nDc8wo6fe9UQnCJHtkTS5Izp0ayVSXFKWrU7siXe
         ZxDc4NLwIYccXcCH3/WVkv9S86b69QfDGfxcNzhS1iKkACcjfaRmxRJRzvO5XPgooMzk
         Zs6w==
X-Gm-Message-State: ANhLgQ3OJ2hE+9CTE5b/UQqVmRCa10ZGkzCS2FQY1NBqOo3wZeiTDt3e
        s+qcr7CgpqRopmBYAZ9lgKQqKXWfzx0=
X-Google-Smtp-Source: ADFU+vvlSpRwHKn4r6g703Ne60gh2l2x19YSD2cUdpHUPeweDs5ZyHaHm8b4wc+Bl5wfRYsNGn1JCA==
X-Received: by 2002:a05:6830:10a:: with SMTP id i10mr10498831otp.190.1585592178291;
        Mon, 30 Mar 2020 11:16:18 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net ([2600:1700:19e0:3310:81db:d33f:7ec:a679])
        by smtp.gmail.com with ESMTPSA id o1sm4480246otl.49.2020.03.30.11.16.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2020 11:16:17 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
From:   Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <294a52cd-2f60-41e5-a58f-a74151a83b08@www.fastmail.com>
Date:   Mon, 30 Mar 2020 13:16:16 -0500
Cc:     Joel Stanley <joel@jms.id.au>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9360D2B2-8242-4BA1-BF06-8916E87EDE67@gmail.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
 <20200306170218.79698-2-geissonator@yahoo.com>
 <294a52cd-2f60-41e5-a58f-a74151a83b08@www.fastmail.com>
To:     Andrew Jeffery <andrew@aj.id.au>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> On Mar 26, 2020, at 6:20 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
>=20
> On Sat, 7 Mar 2020, at 03:32, Andrew Geissler wrote:
>> Name the GPIOs to help userspace work with them. The names describe =
the
>> functionality the lines provide, not the net or ball name. This makes =
it
>> easier to share userspace code across different systems and makes the
>> use of the lines more obvious.
>>=20
>> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
>=20
> So we're creating a bit of an ad-hoc ABI here between the DT and =
userspace.
>=20
> Where are we documenting it?

Yeah, so far it=E2=80=99s basically design by precedent. If you want =
your OpenBMC
function to work then follow the standards we're setting in other =
dts=E2=80=99s.

Is there a good place to document this? I could create a OpenBMC design
doc but that would not address non-OpenBMC areas.

>=20
> Generally I think the idea is good though, so:
>=20
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Thanks

>=20
>> ---
>> arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 37 =
+++++++++++++++++++---
>> 1 file changed, 33 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts=20
>> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index bc60ec291681..4bcc82046362 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -478,32 +478,61 @@
>> 	pinctrl-names =3D "default";
>> 	pinctrl-0 =3D <&pinctrl_gpioh_unbiased>;
>>=20
>> +	gpio-line-names =3D
>> +	/*A0-A7*/	"","cfam-reset","","","","","","",
>> +	/*B0-B7*/	"","","","","","","","",
>> +	/*C0-C7*/	"","","","","","","","",
>> +	/*D0-D7*/	=
"fsi-enable","","","","","led-sys-boot-status","led-attention",
>> +				"led-fault",
>> +	/*E0-E7*/	"","","","","","","","presence-pcie-e2b",
>> +	/*F0-F7*/	"","","","","","","","checkstop",
>> +	/*G0-G7*/	"fsi-clock","fsi-data","","","","","","",
>> +	/*H0-H7*/	=
"onewire0","onewire1","onewire2","onewire3","","","","",
>> +	/*I0-I7*/	"","","","power-button","","","","",
>> +	/*J0-J7*/	"","","","","","","","",
>> +	/*K0-K7*/	"","","","","","","","",
>> +	/*L0-L7*/	"","","","","","","","",
>> +	/*M0-M7*/	"","","","","","","","",
>> +	/*N0-N7*/	"","","","","","","","",
>> +	/*O0-O7*/	"","","","","iso_u164_en","","fsi-trans","",
>> +	/*P0-P7*/	=
"ncsi_mux_en_n","bmc_i2c2_sw_rst_n","","bmc_i2c5_sw_rst_n","",
>> +				"","fsi-mux","",
>> +	/*Q0-Q7*/	"","","","","","","","",
>> +	/*R0-R7*/	"","","","","","","","",
>> +	/*S0-S7*/	"","","","","","","","",
>> +	/*T0-T7*/	"","","","","","","","",
>> +	/*U0-U7*/	"","","","","","","","",
>> +	/*V0-V7*/	"","","","","","","","",
>> +	/*W0-W7*/	"","","","","","","","",
>> +	/*X0-X7*/	"","","","","","","","",
>> +	/*Y0-Y7*/	"","","","","","","","",
>> +	/*Z0-Z7*/	"","","","","","","","",
>> +	/*AA0-AA7*/	"","","led-hdd-fault","","","","","",
>> +	/*AB0-AB7*/	"","","","","","","","",
>> +	/*AC0-AC7*/	"","","","","","","","";
>> +
>> 	line_iso_u146_en {
>> 		gpio-hog;
>> 		gpios =3D <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
>> 		output-high;
>> -		line-name =3D "iso_u164_en";
>> 	};
>>=20
>> 	ncsi_mux_en_n {
>> 		gpio-hog;
>> 		gpios =3D <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
>> 		output-low;
>> -		line-name =3D "ncsi_mux_en_n";
>> 	};
>>=20
>> 	line_bmc_i2c2_sw_rst_n {
>> 		gpio-hog;
>> 		gpios =3D <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
>> 		output-high;
>> -		line-name =3D "bmc_i2c2_sw_rst_n";
>> 	};
>>=20
>> 	line_bmc_i2c5_sw_rst_n {
>> 		gpio-hog;
>> 		gpios =3D <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
>> 		output-high;
>> -		line-name =3D "bmc_i2c5_sw_rst_n";
>> 	};
>> };
>>=20
>> --=20
>> 2.21.0 (Apple Git-122)
>>=20
>>=20

