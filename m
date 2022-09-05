Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480E45ADAD9
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 23:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiIEVWF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Mon, 5 Sep 2022 17:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiIEVWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 17:22:04 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510A658B64
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 14:22:02 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2047.outbound.protection.outlook.com [104.47.22.47]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-43-2kafLV92O9K3x7q8NW2yOA-2; Mon, 05 Sep 2022 23:21:58 +0200
X-MC-Unique: 2kafLV92O9K3x7q8NW2yOA-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0148.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 21:21:57 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::6c6d:333:ab23:3f5b%2]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 21:21:57 +0000
Date:   Mon, 5 Sep 2022 23:21:56 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
Message-ID: <20220905212156.GB6180@francesco-nb.int.toradex.com>
References: <202209050952.vfkohsRg-lkp@intel.com>
 <CACRpkdaLQ68VfYCfv40hGuGnpaMKchiTOSTJy9rnDKnBOQnFDw@mail.gmail.com>
In-Reply-To: <CACRpkdaLQ68VfYCfv40hGuGnpaMKchiTOSTJy9rnDKnBOQnFDw@mail.gmail.com>
X-ClientProxiedBy: ZR0P278CA0049.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::18) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 932564e6-0fe1-4af5-81ab-08da8f84a9b5
X-MS-TrafficTypeDiagnostic: GV0P278MB0148:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: qSXYy4Xf3YwLh0zJYugat6/WNhsLPveL1/SDbc+XTtlouQk3F0kGCGTYOkC8gq8Z376SvCuypCdNOY8KzROc53DTrt94i+G4F2TlGFi3Vay6YSfuFaSd9sGfYQmd3RKTyidAxJi7gm4svsyHK/mvloKyEPVos1U2yPBCXC8z6OEYvo2ZQlUMUClMP52ItIzk/zZH/BFCXrK5jxU6KlQ0j3M+f7LnfkUbebii+KpZ13DxGjYxBbACdei9yBO0wKn3O3hUrFbC17iGuBBjS+7icQ4ClUZEPmfzBQGdWKltwPx2+ANsWmOHLhNAmRbQGO10nXkrSmT+F9owCbyyUmaw69sw5tUXSc1GfbV1LdWPHCMX7Te66Z6hGrTKDjn4cyd2zMXexWO65WHUE6AWZw51K45cpwaeVswYFqoODKk4g/OeLrH/3Lmn27DZH9oW0wN794VfH5YqvGXUYjaK7WIIdx2RFvFdbNLVjyZ7paC7GoNj0qyYPLa2U3Mmtk0p+qttevt2UGAxLl5QflzCH6UiJFzSt/c/uV1d7vGtLk+6CRmrXuGUWLuysvOPk/G9sL5aGzs/PK43WiFleH8xuDabz2csVBqm6JmvXWlrtT1s+cWLyQoow+1VGFwUl429Ky1WM2XRbU74YfNX36/5W0dHtk/M78tvF73rxTgjD6gKGVrSXXC0q17ET87wH44YGtWkrqtNHsnAALaAG0Yr14GNsHVvp+dfDpIJQzHutY2KLUSchs5xD9OWFDIHuGczrqUE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(136003)(366004)(376002)(346002)(396003)(4326008)(66556008)(8676002)(33656002)(66946007)(8936002)(5660300002)(6506007)(83380400001)(26005)(52116002)(53546011)(478600001)(6486002)(41300700001)(1076003)(186003)(86362001)(316002)(6916009)(54906003)(66476007)(38350700002)(2906002)(38100700002)(6512007)(4744005)(44832011);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c2I39aWNstTdrSO0/wWdWM41nz9ps439r44oYCguIn6ufrFCFKDWKxU9SYl3?=
 =?us-ascii?Q?6zcJwBSAGd/j+RHWAriIzeh9UQs1osQlYk4IbC6FO5Ad42mfvcoBA77QVY0Q?=
 =?us-ascii?Q?is7nxuShgdu11fR67pId9kqszQmDyX+txr96nHimJ3t7ybp8BYi1fpy5lUVJ?=
 =?us-ascii?Q?k0opd+nB1e+iTvKu8l6D0mFZmQmorNcodiavfUUX2NCDNZQ6A1g3HdkOS3CV?=
 =?us-ascii?Q?KtilJ+bOaUJ+ioLElQipz11a45oOGUn5cvePo4I0465k+cQ+eRIX3X6eF40a?=
 =?us-ascii?Q?aBXJAdDONDwSendQ1QOIthvNekqTCazV/SAkAtI6e36Bj95tkomjgqIH09vv?=
 =?us-ascii?Q?ZvjBbsgiJW6AbjGuDhMLg5X9t+c1k76JNwnhSoevuGthamG32sPQ78Do0FIp?=
 =?us-ascii?Q?Ki3TUQRLY7w3kDONEP42Szy6zRw92BRD/AQ1CjSOuminGIAFkzIlnMT3b2gf?=
 =?us-ascii?Q?0goV78VGyhe1t02vcBeehZ5NGiHil+rGgYhw6DRDASxkY1CRU9+sQwC5lTy7?=
 =?us-ascii?Q?udX6lQCpL34rhZ8egPgITjl48JnO0EwBMNLl7U55Qb+7iI1gr1/wf3ECJIL3?=
 =?us-ascii?Q?y31EOdDDX+KAzw71J6uUHltg/mnaA0n/WmflL1yMMxCk/vo48qPmJ6o4BjHE?=
 =?us-ascii?Q?fboe7LPS5t+BeGBRSdSNRdkmK/P9SzUNDQZWOLj3MztTSgXMgUe40L97sUIq?=
 =?us-ascii?Q?TxvOocc3w/L1liWjH84l0ZYsHGhRkdSnudv1M7tNt0Ij0ULi9MrnGPahMloi?=
 =?us-ascii?Q?gUA2reCPXfdlukJ2G/PyiTjoBj3T2V+Xih9T2EMODO8jfh0ifNckONGMaJ1l?=
 =?us-ascii?Q?L8mLA1eSKTATCUbXVicscH6fy9K7zxKRvQgB0w8ty9nU83NRVnEq47LCrxai?=
 =?us-ascii?Q?SUGEAWmz0PVjzUV1ecFFgGANBatqsZtUhC1I/S4PAMU6bini65O3G1qL964T?=
 =?us-ascii?Q?2Slz6fxg+5Kp7wesORtlSpxTrHG/pEU3JXH8RdrJj3VpdmelpVEWBmWQvnqV?=
 =?us-ascii?Q?yQlEdsv70Ham6fAH9yjwM7Z2jTcH4P1LJzvDPSk/XAUMsFaMtvQmsuUarkSH?=
 =?us-ascii?Q?1ug01F+BkzIJbvPyMkOT0JOp3nhwAobm9cLQHi7XRZIiAJ8Gjnb0M/VIjjpW?=
 =?us-ascii?Q?kwbHxUx3AexV3BpUx58/X2KOVmV4FEgcYlQ1kOYI/HIFVrB+CI9umjYFFd1v?=
 =?us-ascii?Q?p2Vhi4zOY3Mlg32s8qtYB/DV84BkYll6fptGOMcLdM8sQO3yQ5+S9BDvDL6q?=
 =?us-ascii?Q?mYUGCH8nc7Fjuz8IMKj7wbpgdkAtPEtSIFAOc0BgmjbOvnEipNxvqebe4Awb?=
 =?us-ascii?Q?3qWJeQVhprF5Z9/soRO4Q5BXFb7sMTBHidckFFhrA5oe8vq29qclIMUUwvOd?=
 =?us-ascii?Q?ayy2sUd9BVvSw0n0GgrymvQ2N1Kg800B1ygpWuMKhCv97upN1QEQVn+aKn3t?=
 =?us-ascii?Q?GjFfSHEKUfAdkVHU0afcPjpsruXE1tTpXsBDu0uUs8HLKw183HbzUtPMeR/s?=
 =?us-ascii?Q?46QTdqyWoACnE/2rhK5OSadL0ytPx6FYUxM4dYcYgRV4RUiHBl00oKuFI2jt?=
 =?us-ascii?Q?O59cZQLuQ0Oy4AFxEfZ4h6+qOgkE9r2fsbWsoTLTJG7DD50aN5/CzGh3+kb/?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932564e6-0fe1-4af5-81ab-08da8f84a9b5
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 21:21:57.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAABY9gJoeNwqHxaU6xoZdxJ84ChEROSKzMP3sh+0Yq5bv8C4//hLbYuIdiuMFmwWUNdNEUsnrTJZGLheQ6cDcyXfgcN803TQ2TbA34SluE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0148
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 05, 2022 at 11:08:11PM +0200, Linus Walleij wrote:
> On Mon, Sep 5, 2022 at 3:55 AM kernel test robot <lkp@intel.com> wrote:
> 
> > kismet warnings: (new ones prefixed by >>)
> > >> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX when selected by PINCTRL_IMX8MM
> >
> >    WARNING: unmet direct dependencies detected for PINCTRL_IMX
> >      Depends on [n]: PINCTRL [=y] && OF [=n]
> >      Selected by [y]:
> >      - PINCTRL_IMX8MM [=y] && PINCTRL [=y] && SOC_IMX8M [=y]
> 
> I have a hard time to understand these warnings at times, but I suspect
> you need a
> depends on OF

I'll have a look, however while the recent build errors in pinctrl-imx.c
are because after my change for the first time it is build without
ARCH_MXC and with COMPILE_TEST, this to me seems not a regression.

Am I wrong?

Francesco

