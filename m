Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADA95B14D7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 08:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiIHGkM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 02:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbiIHGjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 02:39:54 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E17817045;
        Wed,  7 Sep 2022 23:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619179; x=1694155179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7ysp4HoUqK/qz8eut/nUD/9tsqGwws00JLosedIh9sM=;
  b=wJAhYbaCZLMk4yAr4SFJuw43If0CCvfLrSj9YG19/4ehSNkWDwLgyw4+
   LH3HiWlQP1IDOAtSUNyd9kmzMQW8rl4gxIWJkob3hw0kxe9NfNw1wX2ev
   tQ2OndRckSPECBzX2ZVoNynpXBBC0yy0ovmdIOew0YFIge50JLPkl42y3
   RT5iGEuDl+3KmEkWqeeCnWLoSZfSflB6yoW9WguKbjhjhp/Xkk6h3LwNM
   Scu0x7VPxvlNcKpWqiaaXZsKpbJvmevpiccbFG1p37sFKxU6UTVtJGaJi
   UilNBD0Q93n1vU8tr0w3+sm5tfLiiKD0teqGYmLda92Wc0qiC+RkQCzQv
   g==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="189923360"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:39:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:39:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+TkilQaoMg+P8i9O581Dy8Btlax1a3iqOtN17eT2mvRILP95S1odssSWAidERB13Bq8nJ8vT3fkuIFAOV0s/OFn+Es/IBGB2ABvKhAPwblvlkcUBqK7WUTgjTzu8g8kkpVTx+lHVAGkwBUExoZum3eN3K/GuUA25O+seIRQeij6OjsXK0EeBwMdBEM3z7OPbNiJikcvhbCoHaAUHftPF0kHabz5AoqGXUiA/ZR0ool6pO8oF6VkljcpZ7+jBjKFiyBoN7xbVshrlTxy/hTjNoosMGwS58+g3MIYFtP7Rrkas2oeKdoIor2Tqz4d0H7PwyRALFfErMAh4vn95pPcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noY5Wa15eu4DYfVKR2Fqf5o6i+0GnzGNX62peGMEQDY=;
 b=hFswqS3RQA89r6gLKqZ4nnxfebpccv8sZuVmyiRfKhX6Qbrfj2GinvOer0t3FKr4rjRPzzSCcEqbFQaPJRG3gO9TeodxSTFQ0DcbKa0r35A9ifAUN1Bno6vLnnFfrc6qYdps2chUba/Y4zVeAuuu8pUVXxN43TE2c+mbhLv9b1EPL+X3rvYnqli9mMKcu5xY4ZGnShqIJwaI9ZsKR3tmdmT1HZU0X2vQtqMr/fL4WlJu4SATMJvyv7IF7e8SPfTfkx5FMsGoIUNaeAZPV7sfYMRAMwr0jm4/CqIGx1xE/K6euDuhG/psMOqfblJ6Mbzz81Rqaj3LYXrZeJBgCXWPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noY5Wa15eu4DYfVKR2Fqf5o6i+0GnzGNX62peGMEQDY=;
 b=EkMHFA9OqCj0b+WSbqKhHV+Cs7Oz5CGKDtq4Ac6dx68T6JA1V1tNbNMyIM6XsoR46QDcGLX1yvOb2dv9KaNMSny4A92XUPrzbzE1mW4QCVUN8P7Ul9rGj1VF8j8KY0NB5HxbEfWktn9b2okQT+mNmCLsieTKYHRd6DHscfSPW6U=
Received: from BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:39:37 +0000
Received: from BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780]) by BN8PR11MB3668.namprd11.prod.outlook.com
 ([fe80::3198:2077:56c7:1780%4]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 06:39:37 +0000
From:   <Kumaravel.Thiagarajan@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <weiyongjun@huaweicloud.com>, <arnd@arndb.de>,
        <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
 module_auxiliary_driver
Thread-Topic: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
 module_auxiliary_driver
Thread-Index: AQHYwpJFcj8rv3umvUO2Kgd27/1mVq3UB0oggAAFAQCAAQm5kA==
Date:   Thu, 8 Sep 2022 06:39:37 +0000
Message-ID: <BN8PR11MB3668ED7930C8F9739FF87994E9409@BN8PR11MB3668.namprd11.prod.outlook.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-5-weiyongjun@huaweicloud.com>
 <BN8PR11MB3668C4354AB9D0D1D608F0C6E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
 <Yxiu8m+mJg32KdVS@kroah.com>
In-Reply-To: <Yxiu8m+mJg32KdVS@kroah.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_|SA2PR11MB4988:EE_
x-ms-office365-filtering-correlation-id: cc8193ca-ed31-43f4-240b-08da9164e695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vjlv1cKBB3aHEb4+x9ulVOOYM+Emupu/7gyFWSxTMaMxva+I5CoNuUGvMHANco5iVp2kZGMTpLffOKNs2yR/t8gblrESzKwCGXJdVZgIWlisj677n9xQe1nP4EOfnVzGE5gMbRXzeVH33pH1YzaQyGuh5nCR06l7RHEvg4IfUE6kfaq9xla96WPsr5qabvlqKsuYI2wH/RrNAaXonWvTTxnMLXQnk47r7H9vGdw/hu0c6/t1g1o/IrXyGxvw9bycLoGHJSpoxuST+Yn9Cjgf+J+6UBiS/gsXROR7wjZZbSUUFdA/TtJyD4ZC0n1lAbF9W6gvX/8kt5Sbi4xK9qwhywWPe8yU9CMLYUR4+4ilSrUp/Q0BKnHTe+Ofna7q8Bd34nLMI7pok2fRIzRUYSj36Pa0GIumdkVkCY8iZ9zVRHIg9g4lV7Pwq8bk0K+IVCLJ18knwegSXrCv81HM3pXfQMe+HYTAxSDmluF1XXChdmDMuwI13j68AbFkZV4tKx1teoiRO5yDEcn5ENxCOebrL43FtF1fnmKC26ztLCHzf998zVw7d7E6VgeHcE1m9tZg1NgIh7caDwr4Pn1x7KC1LCoLgUAIrm/T3WXS7HlHcdMqDy5uqIoKBg9GkQShqnF8hFbGvNYq+so9l1zjvl/kOH/IsOPWaHPo5ssHR41h38CYLz7F+6fRpas6x/lJ01HMrB99DUaSOGO9VefkpGvOp7DODOgoQ9ylU0DTcICjRVpJ4nLrmrvcDV03P0Y0d7BjGu4bq/YJQv1u2MUWsAqgdcMI18AKhD8EqAZ+/ELWlIzseMuJoBt8JkKU8+R2gmS5TI2L4AWCbAjVWxQ7wP2MQZNLFQp6jSBTlSUDE2v15I0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR11MB3668.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(66476007)(38070700005)(38100700002)(71200400001)(55016003)(122000001)(5660300002)(54906003)(316002)(6916009)(86362001)(478600001)(41300700001)(76116006)(6506007)(186003)(8936002)(7696005)(53546011)(2906002)(83380400001)(66556008)(66446008)(26005)(66946007)(33656002)(52536014)(64756008)(9686003)(4326008)(8676002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?duGtMr5+bcU1f1AuRihMgc1BlQaVqIh/gg+rG9tpPJ7N1FhhGC07HNc/hQX8?=
 =?us-ascii?Q?lyxksqv/edDoeCvPYD9oxBH8lNt/RzpnA5bK6pfamr/EbvCvKHmF3oVq2Ae7?=
 =?us-ascii?Q?ed85xA44RUwxJWNt4EKRXVVrXYY03pr1HbRVonoqQn7Koj2xwTKQ3Gj8M7of?=
 =?us-ascii?Q?efEuEK2MnK//4LcFrsbcXh8oqVFdXO/0X+gPfqWz1dRiMpQPu301JV0gNZHp?=
 =?us-ascii?Q?gKXV1XBrSu0gJ90pT/0ZzltmLuU7irH4nrj+3nXSpRhPqLI47/rmIjMycEL7?=
 =?us-ascii?Q?0IYQBmvQeMwIGqgw8n6L8YgdNAZpHUuoxnda3k/wyMiHwXUtnwMvj4yb/4pt?=
 =?us-ascii?Q?YbT4cVgXQsA8SyBr9c0uIVd1VdEG6nsxZiHhKGi01R5oxTpbdEIN814BNhnw?=
 =?us-ascii?Q?WA1jcCdgQvGJq9Z8R7qCScnOgIIE919L0agqwL9WDRltDkNzkc2MmC0VHguj?=
 =?us-ascii?Q?wrO9jQjM+llQzUYUAwsXN+u/b0bKeewTTFZQo4Pqm9TrW394NrSobCU5onu0?=
 =?us-ascii?Q?55K5pERGueWTyi0Ed6IV0Vj69F7l+9fET3dDbrrkbTo64XRaTRY9X71D6pPw?=
 =?us-ascii?Q?Ts+BbZ1soCvvE717M55Qn3+bZ2rqVm5ROv7SS42AcntyBfcWHwafU/vm9jjY?=
 =?us-ascii?Q?TQ0dIfqaU8ubZaw3r+6fM06j1vkRUMBtklz5QY99dCOpfwpET6XkoQYEpqv9?=
 =?us-ascii?Q?lgOS/d0aDMZx+6NexLUihWPT0BI1ja++97zHDO+dwprvcRY7uX9lkuCQE4ul?=
 =?us-ascii?Q?TJzpQe6Ty6tzDr52A2QBaBFeLB0ZzfBYlwh60kdSYmXJgvU50UQVPWtDzH2A?=
 =?us-ascii?Q?WP2fOlbDXt5K2YPKDAj+25etAcy/mBnqWpmBtgtysmzalIRS5af9yRNG8+uZ?=
 =?us-ascii?Q?eKqwSNcLmMGPcuhP7Xop01I09go7J0nGr2DJ7vu76kr05H1YfPxHA1hcYdxX?=
 =?us-ascii?Q?4tdAjAE2OrgZafzfburGbsQb/hgbXD43nZwcO532kvSw0C8gM24a6MOjTf3O?=
 =?us-ascii?Q?Rb/+rOY0PtpIXNOkZUDujtoMHC8ZjtEwDxbzQAixeG7YWHX7k4BcN05prgWT?=
 =?us-ascii?Q?xq6qd61DalKRt7x4U2XUTT1zbJdIQr7NUHzdGi836BluP8pd8RmWa6empPLq?=
 =?us-ascii?Q?RlBc3It2TcezNKoMQfPoRza9jDsRPai9SimTzZm7boYBb3fUzzI+0vmCx32A?=
 =?us-ascii?Q?ErrYAxSXGhFeU1xiENRkrTFe8lFJiiBtNzP1rbDgsV5g9++akPt2tQTSy+ck?=
 =?us-ascii?Q?2btVhyzGIvd8jHye82TsIeolaFpNEpnJ12ZQPqvYPsyMW1BzmgbOgyrgYVCz?=
 =?us-ascii?Q?PvXZNMInXyYA0DTSowhvXxveRK7zVtq5hxpUlfBYxE29Cat0ljCcZeYuH4cO?=
 =?us-ascii?Q?ry0B0Fl936LPHTF9MkF7t50f+RVapDwRXO5GqQELhe0Ce4m3PdDOaAQlYZhy?=
 =?us-ascii?Q?rjccrJHeZrfe6i7m0PxUmKNWDfBga9KnGWt02VV/L/sheh3EGj0v4hiymexb?=
 =?us-ascii?Q?TlcxBZVQka/hN7n9hMyL1GsMoVWX2RjK0kkLf++fvxby6hRC6Mgj5w7J9D/L?=
 =?us-ascii?Q?XWH2/huzdmy6JkMqYlLY4QrL9Irwdh74O38uE1yD2nwLOegJ7Pqe+Oxezu09?=
 =?us-ascii?Q?rboLNGE6dSr+pNA1xK2ltV4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3668.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8193ca-ed31-43f4-240b-08da9164e695
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:39:37.7324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYM8jaoVPP36323f6hd0WHrPxWWPxv6KeRcjVdJNr5Y6oVwk5YEPoBnmu/3pqz/c30R5MM5wjrCkiudf6fIgQ6X/E+Ci3el3bPXEhegmK51gaLgIawJH7WxB+4ihoOru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Wednesday, September 7, 2022 8:17 PM
> To: Kumaravel Thiagarajan - I21417 <Kumaravel.Thiagarajan@microchip.com>
> Cc: weiyongjun@huaweicloud.com; arnd@arndb.de;
> weiyongjun1@huawei.com; linux-gpio@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: Re: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
> module_auxiliary_driver
>=20
> On Wed, Sep 07, 2022 at 02:35:14PM +0000,
> Kumaravel.Thiagarajan@microchip.com wrote:
> > > -----Original Message-----
> > > From: Wei Yongjun <weiyongjun@huaweicloud.com>
> > > Sent: Wednesday, September 7, 2022 2:05 PM
> > > To: Kumaravel Thiagarajan - I21417
> > > <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
> > > <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Wei Yongjun <weiyongjun1@huawei.com>;
> > > linux-gpio@vger.kernel.org; kernel-janitors@vger.kernel.org
> > > Subject: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
> > > module_auxiliary_driver
> > >
> > >
> > > Use the module_auxiliary_driver() macro to make the code simpler by
> > > eliminating module_init and module_exit calls.
> > I needed this during the experimentation stage. But now these
> > functions only do register and unregister. Hence, can be replaced with
> module_auxiliary_driver.
> > Thanks for your patch.
> > >
> > Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load g=
pio
> driver for the gpio controller auxiliary device enumerated by the auxilia=
ry bus
> driver.")?
>=20
> As you are the maintainer of this driver, you can add these markings to t=
he
> patches and sign off on them when you forward them on to me.  No need to
> force the original developer to do this if you are already going to do it=
 as well.
Sure. Understand this now. Thank you, Greg.

Regards,
Kumaravel
