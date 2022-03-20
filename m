Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A087C4E1AD3
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Mar 2022 10:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243116AbiCTJZm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Mar 2022 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243096AbiCTJZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Mar 2022 05:25:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1472FE75
        for <linux-gpio@vger.kernel.org>; Sun, 20 Mar 2022 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=DPFdoQCQmmhj9TUQ4Pre53eqE/f1
        FELjCE0PsZqk8LA=; b=t1X6KZ97L2zE6vEei/vcsQNAljIACR/1cEd/0i387rRg
        REFwPJyTKLCtK4ZrtLNygW1/m0kgVEkJXwx4c0tSFkdJPgHHXJl/qvFD/obobrCa
        7lhc6PjtOohBFAxYZNBvkvUccB0Qip3g2iREtfuoA031G+xBvX9eI7KURqS3LPE=
Received: (qmail 411040 invoked from network); 20 Mar 2022 10:17:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 10:17:32 +0100
X-UD-Smtp-Session: l3s3148p1@yLtH2aLa/LcgAQnoAFbkANnMMFqLOUjD
Date:   Sun, 20 Mar 2022 10:17:28 +0100
From:   Wolfram Sang <wsa-dev@sang-engineering.com>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: r8a77990: add drive-strength
Message-ID: <YjbxKGNwkyjdUF9Z@ninjato>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
        kernel test robot <lkp@intel.com>,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20220319215706.59519-3-wsa+renesas@sang-engineering.com>
 <202203200832.RD8XJhU1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRCmqLVtDslRCPnB"
Content-Disposition: inline
In-Reply-To: <202203200832.RD8XJhU1-lkp@intel.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--wRCmqLVtDslRCPnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> >> drivers/pinctrl/renesas/pfc-r8a77990.c:5033:38: warning: unused variable 'pinmux_drive_regs' [-Wunused-const-variable]
>    static const struct pinmux_drive_reg pinmux_drive_regs[] = {

Right, G2E has drive_regs as well. Will update!


--wRCmqLVtDslRCPnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI28SQACgkQFA3kzBSg
KbZZaw/9EE+MPCH3hN5mCBQBGHAFrXTUyvS7r9eJDjBxuCz9LI/XFxd23ObdDk3O
Srl5/SgGt9TkmDdeyKZwkPCP8Z7qaQd+rTIreeWa7k5QYALB7zRptmXs58zYBWPq
44/+Ss9HrdpD61UwPSSRpGHNO9Hk5B7UkrG+Z05ZIdpZWBjQbQgQHiBDDoIM1njP
IafMVBPK9Uui/gKA68REjkHW2SG8gs3Pp7l+1JJ+B1csX78gxDgJzfWq6dTMOHci
1jYb+8W7ssQs2MLsa4Ou+UBCtFM+k7ptLwAA7yqwbyOBxL6fZhfI7rW60K0P8pyG
0FYTRfga04DwBh9/aeZ9wODD2mtdojoeMbyMu7K1fK/4QZRWzg1e5n5hyPxtUGOv
dVXQPDy0Kf1WuxX+t2ugE+kaZB7wvGTsVv8ELGu9Qy/pd0UbVzXgfC4nKN8Kv7MR
i40PZLdJc+TysUG76JruQcZPbk3qrbx+VconcXDJdQgb1fhlT4Zs4ZgNZuo1b7ws
z0/OHiULN9PH492RGyBVRpNoVbU0dfTDGuylq2LCL8xwD9fSnSwjQo0AXTtEOA3F
1LUvrgj6K8JE+Di7iCKb7/i0ecZDoiZLfA9/RDCl/PfbHNHnwDrhJ5SC/DbMkBtE
qRGND+D4ft5eh5Cf8jfv5P+Fm4boE9OIcdsO3RdraH3Wp9OaVXE=
=14dA
-----END PGP SIGNATURE-----

--wRCmqLVtDslRCPnB--
