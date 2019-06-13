Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5C4400E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732896AbfFMQCg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:02:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40180 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731396AbfFMIrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 04:47:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so19817477wre.7;
        Thu, 13 Jun 2019 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wXnFbw2PnvR/3sq9KGlaSJyBR1d6hKrCN6HutVmQhHo=;
        b=Xrc+XlYPouXlKqyLZADHlMsX4sJPL+nk1A5YiLSgf1IeAJ4uOp5GvZDKCYogM4W2jD
         bHUq17sfziazSYJPcdPUPWl2bOV+4w2esMkk1cUJhuRfAGYsArKTpHg0T1K/Z1xL2DcN
         1I7+yJmbMY3j3t62QlaAqlXE3EBmV4cqS+FEB7lUehQ7MkxbsPOMzmQXIc2pbuK+a4fI
         Q7lVgeRNI+Ev0QsXDE/r+SRsaZVHh/oE1JyI+bHivqw1flFeF1aYyaK9ZU8ClYNI+xad
         ZNuieNY3F/jQdjuOe/qQiWBRKBAvK70sq0SEITpFvagUCC2TwaXSoSWcwW+VOywtK5SE
         pQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wXnFbw2PnvR/3sq9KGlaSJyBR1d6hKrCN6HutVmQhHo=;
        b=Y6zYBUZkU+1wAHoNnJ4XJHxgINvKrL8xeansXXw36tvedhPyq1PQI61+3NKk9Ey2sq
         lVtVmCc+buqwzY7RVJJa0ElS5O+3EXHV4jv+FWNbm6XIVj0h/MxIwKmxlQW4Z4yArSuG
         1GboxLQ678ilNazHb7d3uTEme3o6xKGkItk4V4wilT9f5wleG1gUziSvEWMn+8m7J8Oy
         BKH1UjoNEayWWYeRDWoO3uIYMX5i2WdTGvfV+ZrvozM24Il2790wDFbLb+0aSsxaNx4y
         pvWs9yYqQ3kAH8DofGhyo7jVWMdTufNnQD6KnxFmroKswQ/vz8zpVBzL1/O+vdh1iDH4
         QaYg==
X-Gm-Message-State: APjAAAWLpu9QahnsdP7WT6ZQIi/zPTYSIv76tv3YqthEazZ+rvnN5TwL
        fvcjUsHjOl2YkyHK0xaAYzoX8m+w
X-Google-Smtp-Source: APXvYqyieJMlQh1zYJusV9EMt5J3/JRv0A5KW6y2qJVYv7L+DGJAqn0xNHCGTaZ9cMqPUmEL2IM6TQ==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr11798887wrq.246.1560415658589;
        Thu, 13 Jun 2019 01:47:38 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l12sm1882585wmj.22.2019.06.13.01.47.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 01:47:37 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:47:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     linus.walleij@linaro.org, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        pdeschrijver@nvidia.com, josephl@nvidia.com, smangipudi@nvidia.com,
        ldewangan@nvidia.com, vidyas@nvidia.com
Subject: Re: [PATCH V3 4/4] soc/tegra: select pinctrl for Tegra194
Message-ID: <20190613084736.GA30664@ulmo>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
 <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <1558007594-14824-4-git-send-email-kyarlagadda@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 05:23:14PM +0530, Krishna Yarlagadda wrote:
> Select PINCTRL_TEGRA194 by default for Tegra194 SOC needed
> for dynamically controlling PCIe pins
>=20
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.3/soc, thanks.

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0CDaUACgkQ3SOs138+
s6Gw+Q/9GEMCAGe1/osKqqMZNuojtuyy3aCNb+QVhJWlJVtLn/VtdBx0AqAuAf63
2HPt17CnmoqKcToQFlPHma+uC0BEiNuPx7E0dPLCddNI9JrNxqNuU7JaPN81WsXi
Spydy5O5ioyDK42BTkWtljUAVHT8KwUDuLDMlvoINV8pWGCRKmU6CuN4+7XraC5R
kZRutq0uc0bILzcVxVbzbe449ZF3y2aZyHdayaEYwPWmpN0JXWkmFIr093TWK7li
NE+KSHUQBxujoct5IkKzgDTHAHLn3edNlzxXDLM1aM3QVN1BIo0ADnybyyFBj69y
bhiOeczT5iI74h8cuNGf5BwCsgk2CgeQX4M3DpQMXHfdkZchqC/xTbSuafI9BiAS
X9sip1PaNzHJyPMrfefXtx2uZJFz8IU6LGUqKsOfomFS4JkvJ/DKJtBaTMU8C+yq
U2FCfMJfm79zUe1Gii2dHK2BCjj2Op8LRW3vKOP9B+qL+EIdBk75VxwbJABAI2ly
C7B2Rkjl4JZ/Q0Co8+vHQ6DSxjNPJB7xnaM0S4oF0TFz++ykcLrnEVZP5QsevWrk
Hjdysh9Od2rXOKhr3NlFHlarY8ZcvQGg2KTLiKpa4IOrC8MAKabs2AmKlsCjxA24
FgzBW5XkLVHGKkUy5SmJSgE2B2Xlb/k9denLDi1UotFiEAMBhZ8=
=7+8+
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
